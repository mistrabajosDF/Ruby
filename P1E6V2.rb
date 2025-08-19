=begin
Función que exprese en palabras la hora que recibe como parámetro:
• Si el minuto está entre 0 y 10, debe decir “en punto”,
• si el minuto está entre 11 y 20, debe decir “y cuarto”,
• si el minuto está entre 21 y 34, debe decir “y media”,
• si el minuto está entre 35 y 44, debe decir “menos veinticinco” con la hora siguiente,
• si el minuto está entre 45 y 55, debe decir “menos cuarto” con la hora siguiente,
• y si el minuto está entre 56 y 59, debe decir “Casi son las” con la hora siguiente
=end

def tiempo_en_palabras(time)
  hora = time.hour
  minutos = time.min

  # Determinamos la hora siguiente
  hora_siguiente = (hora + 1) % 24

  # Preparamos la parte inicial según la hora
  if hora == 1 || hora == 13
    hora_str = "es la #{hora}"
  else
    hora_str = "son las #{hora}"
  end

  # Determinamos la parte de los minutos
  case minutos
  when 0..10
    minutos_str = "en punto"
  when 11..20
    minutos_str = "y cuarto"
  when 21..34
    minutos_str = "y media"
  when 35..44
    minutos_str = "menos veinticinco"
    hora_str = hora_siguiente == 1 ? "es la #{hora_siguiente}" : "son las #{hora_siguiente}"
  when 45..55
    minutos_str = "menos cuarto"
    hora_str = hora_siguiente == 1 ? "es la #{hora_siguiente}" : "son las #{hora_siguiente}"
  when 56..59
    minutos_str = "Casi son las"
    hora_str = hora_siguiente == 1 ? "es la #{hora_siguiente}" : "son las #{hora_siguiente}"
  end

  # Construimos la cadena final
  puts "#{hora_str} #{minutos_str}"
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