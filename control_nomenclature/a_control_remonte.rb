# 
#
def create_remont_table # __________________________________________________________________________________
  @db.execute 'DROP TABLE remont'
  @db.execute 'CREATE TABLE IF NOT EXISTS       
        "remont" 
        (
                "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
             "nomer" TEXT,
           "ps_name" TEXT,
           "class_o" TEXT,
         "disp_name" TEXT,
              "type" TEXT,
              "napr" TEXT,
              "code" TEXT
        )'
   @db.execute 'DELETE FROM remont'     
end

def input_remont hh # ______________________________________________________________________________________
  puts
  puts "Загрузка: #{hh[:filename]} == #{hh[:sheetename]} "
  book = Spreadsheet.open(hh[:filename])                  # Файл выбираем                   
  sheet1 = book.worksheet(hh[:sheetename])                # Лист выбираем
  i = 0
  sheet1.each do |row|
    break if row[0].nil?                                  # if first cell empty
    data_row = row.join('\t').split('\t')
    #                                               Заносим данные в базу данных
    @db.execute 'INSERT INTO remont 
      (
        nomer,
        ps_name,
        class_o,
        disp_name,
        type,
        napr,
        code
      ) 
      VALUES ( ?, ?, ?, ?, ?, ?, ? )', 
      [
            data_row[0], # number     '283'
            data_row[1], # ps_name    'Вешкайма'
            data_row[2], # class_o    'Трансформатор силовой'
            data_row[3], # disp_name  'Т-1-110 кВ'
            data_row[4], # type       'ТНМ-6,3/110'
            data_row[5], # napr       '110'
            data_row[6]  # code       'Т' или 'C' или 'K'
      ]
    i += 1
    print "\r#{i}"
  end
  puts " - ЗАКОНЧЕНА!"  
end
