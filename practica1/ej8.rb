=begin
  Modificá la función del ejercicio anterior para que sólo considere como aparición del segundo String cuan‑
do se trate de palabras completas.
=end

def contar_palabras(string, substring)
    string.downcase.scan(/\b#{substring.downcase}\b/).length
    #\b 	Any word boundary
end

puts contar_palabras("La casa de la esquina tiene la puerta roja y la ventana blanca
    .", "la")
# => 4