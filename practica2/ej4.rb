=begin
 Escribí un método que dado un número variable de parámetros que pueden ser de cualquier
tipo, imprima en pantalla la cantidad de caracteres que tiene su representación como String
y la representación que se utilizó para contarla.
=end

def longitud(*args)
  args.each do |arg|
    str_representation = arg.to_s
    puts "#{str_representation} --> #{str_representation.length}"
  end
end

# Ejemplo de uso:
longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)



longitud(9, Time.now, 'Hola', {un: 'hash'}, :ruby)
# Debe imprimir:
# "9" --> 1
# "2023-09-14 13:22:10 +0000" --> 25
# "Hola" --> 4
# {:un=>"hash"} --> 13
# ruby --> 4 