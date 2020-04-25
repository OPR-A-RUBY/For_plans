# Проверка соответствия номенклатуры
#
#

def input_sap_data

  @db.execute 'CREATE TABLE IF NOT EXISTS       
        "sap_data" 
        (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
              "code" TEXT,
               "spp" TEXT,
            "numz_r" TEXT,
            "numz_z" TEXT,
             "names" TEXT,
                "ei" TEXT,
             "date1" TEXT,
             "date2" TEXT,
               "atm" TEXT
        )'
                                          puts "\n===>> Таблица создана - 'sap_data'" 

  filename = "control_nom.xls"    

  book = Spreadsheet.open(filename)

                                          puts "\n===>> Файл #{filename} найден"
  sheetename = 'SAP-21'                                       
  sheet1 = book.worksheet(sheetename) # can use an index or worksheet name

                                          puts "\n===>> Вкладка #{sheetename} найдена"
  hh = {}
  i = -2
                                          puts "\n===>> Начинаю считывание данных ..."
  sheet1.each do |row|

    break if row[0].nil? # if first cell empty

    data_row = row.join('\t').split('\t')
    
    if data_row[0][0] == '0'  # Если это строка структуры
      output_i i
      code__ = data_row[0]
      spp___ = data_row[2]
      output_c_s code__, spp___
      i = 0

    else                 # Иначе это строка заказа
       @db.execute 'INSERT INTO sap_data 
          (
            code,
            spp,
            numz_r,
            numz_z,
            names,
            ei,
            date1,
            date2,
            atm
          ) 
          VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )', 
          [
                   code__, # code_spp   '01.01.01.01.'
                   spp___, # name_spp   'Ручная расчистка'
              data_row[0], # number R   'P04410062382.'
              data_row[1], # number Z   '9815559'
              data_row[2], # code_name  'Ручная расчистка ВЛ Пом-Тюр (09)'
              data_row[3], # ie         'ГА'
              data_row[4], # start      '01.09.2020'
              data_row[5], # stop       '30.09.2020'
              data_row[6]  # atm        '11.4' 
          ]
      i += 1
    end

  end
  puts
  puts "Ready. Please press Enter key"
  gets

end
