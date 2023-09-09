=begin
Escribí una función longitud que dado un arreglo que contenga varios String cualesquiera, retorne un nuevo arreglo donde
cada elemento es la longitud del String que se encuentra en la misma posición del arreglo recibido como parámetro. 
Por ejemplo:

longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2023'])
# => [4, 6, 4, 12]

=end
def longitud(palabras)
    salida = []
    palabras.each do |variable|
        salida.push variable.length #Análogo a salida << variable.length
    end


    palabras.each_with_object([]) do |variable, acumulador|
        acumulador.push variable.length 
        #Retorna acumulador
    end


end

# FORMAS DE HACERLO

# MAS FACIL DE HACERLO
=begin
def longitud(palabras)
    palabras.map{ |variable|
        variable.length
    }

    palabras.map {|variable| variable.length}

    palabras.map(&:lenght)
end
=end

#COMENTARIOS
=begin
- {} o do end. Para más de una línea, usar do-end (es una convención)
- map/collect son sinonimos, hacen lo mismo
- map no modifica arreglo, genera nuevo elemento con los resultados y lo retorna al nuevo arreglo
- map! SI modifica el elemento
- debo indicar nombre de la variable con la que toma cada posición del arreglo, con PIPES | palabra |
=end

longitud(['TTPS', 'Opción', 'Ruby', 'Cursada 2023'])