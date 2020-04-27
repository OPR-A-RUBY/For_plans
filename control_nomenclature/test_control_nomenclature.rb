# ====================================================================================================
#                                                             Это TEST для проверки номенклатуры 
# ====================================================================================================

require 'sqlite3'
require 'spreadsheet'

require_relative 'z_hashes'
require_relative 'helper'
require_relative 'a_sap_data'
require_relative 'a_plan_ps'

require_relative 'b_demidov'
require_relative 'b_bahtiev'

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

@sap_hh = {} # ХЕШ для запоминания позиций SAP  {'01.01.01.01. Ручная расчистка' => 12}

file_name = 'development.sqlite'

@db = SQLite3::Database.new file_name

loop do 
  
  puts  'Для ввода ДАННЫХ из SAP АСУ ТОиР введите _ 0'
  puts  'Для ввода МНОГОЛЕТКИ по ПС введите _______ 2'
  print 'Иначе начинаем обработку _________________ '
  u = gets.chomp 

  if u == 'q' 
    break
  elsif  u == '0' 
    create_sap_data_table # ______________________________________ ДАННЫЕ ИЗ SAP АСУ ТОиР ______
      hh = {:filename => 'control_nom.xls', :sheetename => 'SAP-21'}
                          # Заносим в ХЕШ {Имя файла и название вкладки}      
      input_sap_data hh   # Импорт информации из файла в БД 

  elsif u == '2'    
    create_remont_table   # ______________________________________ ДАННЫЕ ИЗ МНОГОЛЕТКИ ________
      hh = {:filename => 'kr-21.xls', :sheetename => 'kr-data'}
                          # Заносим в ХЕШ {Имя файла и название вкладки}      
      input_remont hh     # Импорт информации из файла в БД
      #
      hh = {:filename => 'tr-21.xls', :sheetename => 'tr-data'}
                          # Заносим в ХЕШ {Имя файла и название вкладки} 
      input_remont hh     # Импорт информации из файла в БД

  else                    # __________________________________________ ОБРАБОТКА ДАННЫХ ________
    @path = 'files-objects/'  # В эту папку будем создавать файлы
    create_file_from_demidov  # Создаём файлы по данным МНОГОЛЕТКИ от Демидова_АА
    
    create_file_from_bahtiev  # Создаём файлы по данным из SAP_ТОиР от Бахтиев_ИА

    # Сравниваем файлы по срдержимомму.
  end

end

@db.close

puts "Программа закончилась."