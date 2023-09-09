=begin
Mejorar la función anterior en una nueva llamada listar_mejorada para que además reciba
opcionalmente un parámetro llamado pegamento (su valor por defecto debe ser ": ") que sea
el que utilice para unir los pares de clave/valor.
=end

def listar_mejorada(hash, delimiter=":")
    list = ""
    hash.each_with_index do |(key, value), index|
        list += "#{index + 1}. #{key}#{delimiter}#{value}\n"
    end
    list.chomp # Elimina el último salto de línea adicional
end

puts listar_mejorada({ perros: 2, gatos: 2, peces: 0, aves: 0 }, " -> ")
# => "1. perros -> 2\n2. gatos -> 2\n3. peces -> 0\n4. aves -> 0"