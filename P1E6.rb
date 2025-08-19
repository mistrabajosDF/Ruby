=begin
Función que exprese en palabras la hora que recibe como parámetro:
• Si el minuto está entre 0 y 10, debe decir “en punto”,
• si el minuto está entre 11 y 20, debe decir “y cuarto”,
• si el minuto está entre 21 y 34, debe decir “y media”,
• si el minuto está entre 35 y 44, debe decir “menos veinticinco” con la hora siguiente,
• si el minuto está entre 45 y 55, debe decir “menos cuarto” con la hora siguiente,
• y si el minuto está entre 56 y 59, debe decir “Casi son las” con la hora siguiente
=end

def tiempo_en_palabras(t1)
      casi=false

      h= t1.hour

      case t1.min
      when 0..10
            m="en punto"
      when 11..20
            m="y cuarto"
      when 21..34
            m="y media"
      when 35..44
            m="menos veinticinco" 
            h = t1.hour== 23? h=00 : h=h+1
      when 45..55
            m="menos cuarto" 
            h = t1.hour== 23? h=00 : h=h+1
      when 56..59
            casi=true
            h = t1.hour== 23? h=00 : h=h+1
      end

      #IMPRIMIR
      if (casi) && (h!=1)
            puts "Casi son las #{h}"
      elsif (casi==false) && (h!=1)
            puts "Son las #{h} #{m}"
      elsif (casi) && (h==1)
            puts "Casi es la #{h}"
      elsif (casi==false) && (h==1)
                  puts "Es la 1 #{m}"
      end
end

tiempo_en_palabras(Time.new(2024, 10, 21, 10, 1))
# => "Son las 10 en punto"
tiempo_en_palabras(Time.new(2024, 10, 21, 9, 33))
# => "Son las 9 y media"
tiempo_en_palabras(Time.new(2024, 10, 21, 8, 45))
# => "Son las 9 menos cuarto"
tiempo_en_palabras(Time.new(2024, 10, 21, 6, 58))
# => "Casi son las 7"
tiempo_en_palabras(Time.new(2024, 10, 21, 0, 58))
# => "Casi es las 1"
tiempo_en_palabras(Time.new(2024, 10, 21, 23, 40))