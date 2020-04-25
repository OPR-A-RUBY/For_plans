# ====================================================================================================
#                                                             Это TEST для проверки номенклатуры 
# ====================================================================================================

require 'sqlite3'
require 'spreadsheet'

require_relative 'helper'
require_relative 'a_sap_data'
require_relative 'a_plan_ps'

require_relative 'b_demidov'
require_relative 'b_bahtiev'

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

file_name = 'development.sqlite'

@db = SQLite3::Database.new file_name

loop do 
  
  puts  'Для ввода ДАННЫХ из SAP АСУ ТОиР введите _ 0'
  puts  'Для ввода МНОГОЛЕТКИ по ПС введите _______ 2'
  print 'Иначе начинаем обработку _________________ '
  u = gets.chomp 

  if u == '0' 
    create_sap_data_table # ______________________________________ ДАННЫЕ ИЗ SAP АСУ ТОиР ______
      #
      hh = {:filename => 'control_nom.xls', :sheetename => 'SAP-21'}
      input_sap_data hh

  elsif u == '2'    
    create_remont_table   # ______________________________________ ДАННЫЕ ИЗ МНОГОЛЕТКИ ________
      #
      hh = {:filename => 'kr-21.xls', :sheetename => 'kr-data'}
      input_remont hh
      #
      hh = {:filename => 'tr-21.xls', :sheetename => 'tr-data'}
      input_remont hh 

  else                    # __________________________________________ ОБРАБОТКА ДАННЫХ ________
    @path = 'files-objects/'
    create_file_from_demidov
    
    create_file_from_bahtiev  
  end

end

@db.close

puts "Программа закончилась."