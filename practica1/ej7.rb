=begin
Escribí una función llamada contar que reciba como parámetro dos String y que retorne
la cantidad de veces que aparece el segundo String en el primero, en una búsqueda case‑
insensitive (sin distinguir mayúsculas o minúsculas).
=end

def contar(string, substring)
    string.downcase.scan(substring.downcase).length
    #counter = 0
    #string.downcase.scan(substring.downcase) { counter += 1 }
    #counter
end

puts contar("La casa de la esquina tiene la puerta roja y la ventana blanca
    .", "la")
# => 5