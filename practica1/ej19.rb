=begin
Implementá las funciones necesarias para que, dado un color expresado en notación RGB, se pueda obtener su 
representación en las notaciones entera y hexadecimal. La notación entera se define como 
red + green * 256 + blue * 256 * 256 y la hexadecimal como el resultado de expresar en base 16 el valor de 
cada color y concatenarlos en orden. Por ejemplo:

notacion_hexadecimal([0, 128, 255])
# => '#0080FF'
notacion_entera([0, 128, 255])
# => 16744448

=end

def notacion_hexadecimal(rgb)
    rgb.each_with_object('#') do |valor, resultado|
        resultado << format('%02X', valor)
    end

    r, g, b = rgb #descompone arreglo y pone alemetnos en esa posiciones, perdiendo los demas elementos si lo de la izquierda es menor
    r, g, *b = rgb #descompone arreglo y pone alemetnos en esa posiciones, NO PIERDE ELEMENTOS
    format('%02X%02X%02X', r, g, b)
end

def notacion_entera(rgb)
    red, green, blue = rgb
    red + green * 256 + blue * 256 * 256
end


# format