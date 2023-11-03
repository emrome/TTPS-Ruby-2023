=begin
Partiendo del script que modificaste en el inciso anterior, implementá una nueva clase de ex‑
cepción que se utilice para indicar que la entrada del usuario no es un valor numérico entero
válido. ¿De qué clase de la jerarquía de Exception heredaría?
=end
class InvalidInteger < ArgumentError
end

def convert_to_integer(value)
    begin
        Integer(value)
    rescue ArgumentError
        raise InvalidInteger, "#{value.chomp} no es un valor numérico entero."
    end
end

cantidad = 0
while cantidad < 5
    begin
        puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
        cantidad = convert_to_integer(gets)
    rescue InvalidInteger => e
        puts e.message
        retry
    end
end

# Luego se almacenan los números
numeros = 1.upto(cantidad).map do
    puts 'Ingrese un número'
    begin
        numero = convert_to_integer(gets)
    rescue InvalidInteger => e
        puts e.message
        retry
    end
end

# Y finalmente se imprime cada número dividido por su número entero inmediato anterior
resultado = numeros.map do |x|
    begin
        x / (x - 1)
    rescue ZeroDivisionError
        0
    end
end

puts 'El resultado es: %s' % resultado.join(', ')