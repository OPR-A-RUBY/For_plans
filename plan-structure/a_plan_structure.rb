# ====================================================================================================
#                                                                      МОДУЛЬ таблици "plan-structure" 
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

  def create_tabl_plan_structure
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
     puts "\n===>> Таблица 'plan_structure' создана" 
  end

  def keep_data_to_db

    file = File.open 'plan_structure.txt', 'r'
    s = 0
    
    file.each_line do |line|
      s += 1;
      data = line.split(/;/)

      @db.execute 'INSERT INTO plan_structure 
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
              data[0], # year       2021;
              data[5], # name       Работы на ЛЭП;
              data[7], # code_name  01.01.;  
              data[2], # level      2;
              data[8], # flag_f     false
              data[4], # color      fff;
              data[3], # sp         slep;
              data[6], # eiz        -;
              data[1]  # code       001-001-000-000-000;
          ]
   # _______________________________________________________________       
   # 0    1                   2 3    4   5             6 7      8
   # 2021;001-001-000-000-000;2;slep;fff;Работы на ЛЭП;-;01.01.;false
   #    
    end

    file.close
    puts "\n===>> Данные в таблицу 'plan_structure' внесены. (#{s} элементов)"
  end  

  def delete_data_from_tabl_plan_structure

    @db.execute 'DELETE FROM plan_structure;'
    puts "\n===>> Данные из таблицы 'plan_structure' удалены."
  
  end
  
  def delete_tabl_plan_structure

    @db.execute 'DROP TABLE IF EXISTS plan_structure'
    puts "\n===>> Tаблица 'plan_structure' удалена."

  end  

  
