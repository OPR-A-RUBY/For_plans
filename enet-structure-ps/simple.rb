require 'spreadsheet'    

book = Spreadsheet.open('silovoe_ps.xls')

sheet1 = book.worksheet('ps') # can use an index or worksheet name

sheet1.each do |row|

  break if row[0].nil? # if first cell empty

  #puts row.join('\t') # looks like it calls "to_s" on each cell's Value

  arr = row.join(';').split(';')

  puts arr.inspect
  gets
  
end
