# Проверка соответствия номенклатуры
#
#

require 'spreadsheet'

filename = "control_nom.xls"    

book = Spreadsheet.open(filename)

sheet1 = book.worksheet('SAP-21') # can use an index or worksheet name

hh = {}
i = 0

sheet1.each do |row|

  break if row[0].nil? # if first cell empty

  arr = row.join('\t').split('\t')

 # puts arr.inspect
  
  if arr[0][0] == '0'  # Если это строка структуры
    code__ = arr[0]
    spp___ = arr[2]
  else                 # Иначе это строка заказа
    nomz_r = arr[0]
    nomz_z = arr[1]
    name__ = arr[2]
    __ei__ = arr[3]
    date_1 = arr[4]
    date_2 = arr[5]
    atm___ = arr[6]
    hh = {
      'code__' => code__, 'spp___' => spp___, 'nomz_r' => nomz_r, 'nomz_z' => nomz_z, 
      'name__' => name__, '__ei__' => __ei__, 'date_1' => date_1, 'date_2' => date_1,
      'atm___' => atm___, 
    }
    i += 1
    print "#{i} = "
  end
  puts "Ready. Please press Enter key"
  gets

end
