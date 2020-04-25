# 
#

def input_tek_rem

  @db.execute 'CREATE TABLE IF NOT EXISTS       
        "tek_remont" 
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
  filename = "tr-21.xls"    
  book = Spreadsheet.open(filename)
  sheetename = 'tr-data'                                       
  sheet1 = book.worksheet(sheetename) # can use an index or worksheet name
  i = 0
  sheet1.each do |row|
    break if row[0].nil? # if first cell empty
    data_row = row.join('\t').split('\t')

    @db.execute 'INSERT INTO tek_remont 
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
            data_row[6]  # code       'Т' 
      ]

    i += 1
    puts i
  end
  puts
  puts "Ready. Please press Enter key"
  gets
end

def input_kap_rem

  @db.execute 'CREATE TABLE IF NOT EXISTS       
        "kap_remont" 
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
  filename = "kr-21.xls"    
  book = Spreadsheet.open(filename)
  sheetename = 'kr-data'                                       
  sheet1 = book.worksheet(sheetename) # can use an index or worksheet name
  i = 0
  sheet1.each do |row|
    break if row[0].nil? # if first cell empty
    data_row = row.join('\t').split('\t')

    @db.execute 'INSERT INTO kap_remont 
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
            data_row[6]  # code       'Т' 
      ]

    i += 1
    puts i
  end
  puts
  puts "Ready. Please press Enter key"
  gets

end
