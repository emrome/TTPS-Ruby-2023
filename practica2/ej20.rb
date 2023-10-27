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
        puts "ARREGLO SHUFFLED #{shuffled}"
        return shuffled.to_enum unless block_given?
        return shuffled.map {|elem| block.call(elem) }
    end
end

puts [1,2,3,4].randomly { |num| num*10 }
puts enumerador=[1,2,3,4].randomly
puts enumerador.next
puts enumerador.next
puts enumerador.next
puts enumerador.next