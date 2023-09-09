=begin 
Escribí una función más genérica, parecida a la del ejercicio anterior, que reciba como paráme‑
tro un String y un número n, y que realice una rotación de n lugares de las letras del String
y retorne el resultado.
=end

def rotX(string, rotation)
    rotated_alphabet = (('A'..'Z').to_a.rotate(rotation) + ('a'..'z').to_a.rotate(rotation)).join
    string.tr("A-Za-z", rotated_alphabet)
end
  
puts rotX("¡Bienvenidos a la cursada 2023 de TTPS Opción Ruby!", 13)
# => "¡Ovrairavqbf n yn phefnqn 2023 qr GGCF Bcpvóa Ehol!"