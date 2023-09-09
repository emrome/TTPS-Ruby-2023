=begin
scribí una función que exprese en palabras la hora que recibe como parámetro, según las si‑
guientes reglas:
• Si el minuto está entre 0 y 10, debe decir “en punto”,
• si el minuto está entre 11 y 20, debe decir “y cuarto”,
• si el minuto está entre 21 y 34, debe decir “y media”,
• si el minuto está entre 35 y 44, debe decir “menos veinticinco” con la hora siguiente,
• si el minuto está entre 45 y 55, debe decir “menos cuarto” con la hora siguiente,
• y si el minuto está entre 56 y 59, debe decir “Casi son las” con la hora siguiente
=end

def tiempo_en_palabras(tiempo)
    hora = tiempo.hour
    minuto = tiempo.min
    siguiente_hora = (hora + 1) % 24
    frase = hora == 1 ? "Es la 1" : "Son las #{hora}"
  
    case minuto
    when 0..10
      frase += " en punto"
    when 11..20
      frase += " y cuarto"
    when 21..34
      frase += " y media"
    when 35..44
      frase = hora == 23 ? "Es la 0" : "Son las #{siguiente_hora} menos veinticinco"
    when 45..55
      frase = hora == 23 ? "Es la 0" : "Son las #{siguiente_hora} menos cuarto"
    when 56..59
      frase = siguiente_hora == 1 ? "Casi es la 1" : "Casi son las #{siguiente_hora}"
    else
      return "Hora no válida"
    end
  
    return frase
end
  
puts tiempo_en_palabras(Time.new(2023, 10, 21, 10, 1))
# => "Son las 10 en punto"
puts tiempo_en_palabras(Time.new(2023, 10, 21, 9, 33))
# => "Son las 9 y media"
puts tiempo_en_palabras(Time.new(2023, 10, 21, 8, 45))
# => "Son las 9 menos cuarto"
puts tiempo_en_palabras(Time.new(2023, 10, 21, 6, 58))
# => "Casi son las 7"
puts tiempo_en_palabras(Time.new(2023, 10, 21, 0, 58))
# => "Casi es la 1"
