# 
def find_ps arr
  #include?
end

def create_file_from_bahtiev
  
  sel = @db.execute 'SELECT name FROM sap_data WHERE code = "01.02.04.10."'

  arr_ps = []

  sel.each do |row_record|

    arr = row_record.inspect
    


    # arr = row_record.split(/ /)

    # arr_ps << arr[0]

  end
  puts arr_ps.inspect
  puts 'created_files_from_bahtiev'
end
