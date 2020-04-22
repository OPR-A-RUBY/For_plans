# ===================================================================================================
#               Это приложение для тестирования структуры таблици "plan-structure" 
# ====================================================================================================

# _____________________________________________________________________ PLAN-STRUCTURE ____ TABL ______
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

def keep_data_to_db

  file = File.open 'plan_structure.txt', 'r'

  file.each_line do |line|

    puts line
    
  end

  file.close

end  

def test
  @db.execute 'INSERT INTO plan_structuret 
        (
            year,
            name,
            code_name,
            level,
            flag_r,
            code_color,
            sp,
            eiz,
            code
        ) 
        VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ? )', 
        [
            data[1],  
            data[2],
            data[3],
            data[4],
            data[5],
            data[6],
            data[7],
            data[9]
        ]
        
  puts "Данные в таблуцу внесены"
  
end

# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

@db = SQLite3::Database.new 'development.sqlite'
                          #
@db.execute 'CREATE TABLE IF NOT EXISTS       
        "plan_structure" 
        (
            "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            "year" INTEGER,
            "name" TEXT,
            "code_name" TEXT,
            "level" INTEGER,
            "flag_r" BOLEAN,
            "code_color" TEXT,
            "sp" TEXT,
            "eiz" TEXT,
            "code" TEXT
        )'

keep_data_to_db
        
@db.close
