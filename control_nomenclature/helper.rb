
# --------------------------------------------------------------------------
def output_i i # Дополнение i до трёх знаков 
  if i >= 100
    n_i = 3
  elsif i >= 10
    n_i = 2 
  elsif i>= 1
    n_i = 1
  end  
  if i != 0 then out = " = "+"_"*(3-n_i)+"#{i} шт." 
  else           out = ''
  end
  return out
end    
# --------------------------------------------------------------------------
def output_c_s code__, spp___  # Формирование полного имени СПП-элемента
  n_c = 15-code__.size
  n_s = 40-spp___.size
  return "#{code__}"+"_"*n_c+"\t#{spp___}"+"_"*n_s
end
# --------------------------------------------------------------------------
def helper_spp_out              # Вывод ХЕШа СПП-элеменнтов и количества заказов
  @sap_hh.each do |key, value|
  puts "#{key} =EQ= #{value}" 
  end 
end
# --------------------------------------------------------------------------
