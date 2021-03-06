# Проверка соответствия номенклатуры
#
#
def create_sap_data_table # _____________________________________________________________________________
  @db.execute 'DROP TABLE SAP_DATA'
  @db.execute 'CREATE TABLE IF NOT EXISTS       
        "sap_data" 
        (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
              "code" TEXT,
               "spp" TEXT,
            "numz_r" TEXT,
            "numz_z" TEXT,
              "name" TEXT,
                "ei" TEXT,
             "date1" TEXT,
             "date2" TEXT,
               "atm" TEXT,
                "ps" TEXT
        )'
  @db.execute 'DELETE FROM SAP_DATA'
end

def input_sap_data hh     # _____________________________________________________________________________

  book = Spreadsheet.open(hh[:filename])
  sheet1 = book.worksheet(hh[:sheetename]) # can use an index or worksheet name
  hh = {}
  i = -2
  j = -2
  puts "\n===>> Начинаю считывание данных ..."
  sheet1.each do |row|
    break if row[0].nil? # if first cell empty

    data_row = row.join('\t').split('\t')
    
    if data_row[0][0] == '0'  # Если это строка структуры
      print "\r"
      print @spp_name         # Выводим старый СПП_элемент
      puts output_i(i)        # Вывводим количество заказов у старого СПП-элемента 
      @sap_hh[@spp_name] = i  # Записываем в ХЕШ пару (старый СПП-элемент => количество заказов)
      i = 0                   # Всё, обнуляем счётчик заказов

      @code__ = data_row[0]               # Запоминаем код нового СПП-элемента
      @spp___ = data_row[2]               # ... и его название  (имя СПП-элемента) 
      @spp_name = output_c_s(@code__, @spp___) # Формируем полное имя СПП-элемента 
      print @spp_name         # Выводим новый СПП_элемент
      @sap_hh[@spp_name] = 0  # Записываем в ХЕШ пару с нулевым значением (иначе последний элемент остаётся упущенным - не попадает в хеш)

    else                      # Иначе это строка заказа ЗАНОСИМ ДАННЫЕ В БАЗУ ДАННЫХ
       @db.execute 'INSERT INTO sap_data 
          (
            code,
            spp,
            numz_r,
            numz_z,
            name,
            ei,
            date1,
            date2,
            atm
          ) 
          VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )', 
          [
                  @code__, # code_spp   '01.01.01.01.'
                  @spp___, # name_spp   'Ручная расчистка'
              data_row[0], # number R   'P04410062382.'
              data_row[1], # number Z   '9815559'
              data_row[2], # name       'Ручная расчистка ВЛ Пом-Тюр (09)'
              data_row[3], # ie         'ГА'
              data_row[4], # start      '01.09.2020'
              data_row[5], # stop       '30.09.2020'
              data_row[6]  # atm        '11.4' 
          ]
      i += 1  # Счётчик заказов в теущем СПП-элементе
      j += 1  # Счётчик заказов во всёх СПП-элементах (Весь план)
      print "\r"
      print @spp_name
      print " #{i}"  
    end
  end
  puts
  puts "ЗАКОНЧЕО! #{hh[:filename]} == #{hh[:sheetename]} = #{j} заказов"
  # helper_spp_out
end
