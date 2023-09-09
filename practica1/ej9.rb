=begin
Dada una cadena cualquiera, y utilizando los métodos que provee la clase String, realizá las
siguientes operaciones sobre dicha cadena, implementando métodos que funcionen de la si‑
guiente forma:

• string_reverso: retorna el string con los caracteres en orden inverso.

• string_sin_espacio: elimina los espacios en blanco que contenga.

• string_a_arreglo_ascii: retorna un arreglo con cada uno de los caracteres convertidos a su 
correspondiente valor ASCII.

• string_remplaza_vocal: cambia las vocales por números:
– "a" o "A" por "4",
– "e" o "E" por "3",
– "i" o "I" por "1",
– "o" u "O" por "0",
– "u" o "U" por "6". 

=end

def string_reverso(string)
    string.split.map(&:reverse).join(" ")
end

def string_reverso_total(string)
    string.reverse
end

def string_sin_espacio(string)
    string.delete(" ")
end

def string_a_arreglo_ascii(string)
    string.each_char.reject { |char| char == ' ' }.each_with_object([]) do |char, array|
        array << char.ord 
    end
end

def string_reemplaza_vocal(string)
    reemplazos = {
      'a' => '4',
      'A' => '4',
      'e' => '3',
      'E' => '3',
      'i' => '1',
      'I' => '1',
      'o' => '0',
      'O' => '0',
      'u' => '6',
      'U' => '6'
    }
  
    string.gsub(/[aeiouAEIOU]/, reemplazos)
end

puts string_reverso("Hola Mundo")
# => aloH odnuM

puts string_reverso_total("Hola Mundo")
# => odnuM aloH

puts string_sin_espacio("Hola Mundo, soy Maria")
# => HolaMundo,soyMaria

print string_a_arreglo_ascii("Hola Mundo")
# => [72, 111, 108, 97, 77, 117, 110, 100, 111]
puts 
puts string_reemplaza_vocal("uUoOiIeEaA CCCccc")
# => 6600113344 CCCccc
