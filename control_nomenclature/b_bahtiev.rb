# 
def find_ps arr
  #include?
end

def create_file_from_bahtiev
  
  line_sql = 'SELECT name FROM sap_data WHERE code = "01.02.04.09."'

  sel = @db.execute line_sql

  arr_ps = []

  sel.each do |row_record|

    str = row_record.to_s
    puts str

    #arr = str.split(/\s|\,/)   ### ЗДЕСЬ ЧТО-ТО НЕ РАБОТАЕТ !!!!
    ### arr = line.split(/\s|\n|\.|\,|\(|\)|\;|\"|\»|\-|\«/)
    #puts arr.inspect
    #gets
    # arr = row_record.split(/ /)
    # arr_ps << arr[0]

  end
  puts arr_ps.inspect
  puts 'created_files_from_bahtiev'
end
