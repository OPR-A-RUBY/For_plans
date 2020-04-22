# ====================================================================================================
#                                                             Это TEST для таблици "enet-structure-ps" 
# ====================================================================================================

# _________________________________________________________________ ENET-STRUCTURE-PS ____ TABL ______
#         id - идентификатор
#       year - год планирования              (integer)    - 2021
#       name - наименование строки           (text)       - Ремонт разъединителей 110 кВ
#  code_name - код строки                    (text)       - '01.02.05.03.'
#      level - уровень вложенности           (integer)    - 4
#     flag_r - признак расчётной строки      (bolean)     - true
# code_color - код расцвктки                 (text)       - 'wait'
#         sp - структурное подразделение     (text)       - 'sps'
#        eiz - единица измерения             (text)       - 'шт.'
#       code - код многомиллиардный          (text)       - 001-002-001-003-000
#

require 'sqlite3'

require_relative 'a_enet_structure_ps'

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

file_name = 'development.sqlite'

File.delete(file_name) if File.exist?(file_name)

@db = SQLite3::Database.new file_name

  create_tabl_enet_structure_ps
                            
  keep_data_to_db_enps

  delete_tabl_enet_structure_ps

  create_tabl_enet_structure_ps
                            
  keep_data_to_db_enps

  delete_data_from_tabl_enet_structure_ps

  keep_data_to_db_enps
        
@db.close
