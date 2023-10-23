=begin
Extendé la clase Array con el método randomly que funcione de la siguiente manera:
    • Si recibe un bloque, debe invocar ese bloque con cada uno de los elementos del arreglo
    en orden aleatorio, sin repetir los elementos sobre los que se lo invoca.
    • Si no recibe un bloque, debe devolver un enumerador que va arrojando, de a uno, los ele‑
    mentos del arreglo en orden aleatorio.   
=end
# Si un iterador se utiliza sin bloque, entonces retorna un Enumerator

class Array
    def randomly(&block)
        shuffled = self.shuffle
        return shuffled.each unless block_given?
        return shuffled.each { |element| block.call(element) }
        # Me retorna el arreglo dos veces, una vez aplicado el block, la otra no
    end
end

puts [1,2,3,4].randomly { |num| puts num + 1}

puts "ENUMERADOR"
enumerador=[1,2,3,4].randomly
puts enumerador.next
puts enumerador.next
puts enumerador.next
puts enumerador.next