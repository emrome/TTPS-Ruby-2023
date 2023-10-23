=begin
Implementá un método que reciba como parámetros un Hash y un Proc, y que devuelva un
nuevo Hash cuyas las claves sean los valores del Hash recibido como parámetro, y cuyos valores
sean el resultado de invocar el Proc con cada clave del Hash original.
=end

def procesar_hash(hash, proc)
    new_hash = Hash.new(0)
    hash.each do |key, value| 
        new_hash[value] = proc.call key
    end
    new_hash
end

hash = { 'clave' => 1, :otra_clave => 'valor' }
puts procesar_hash(hash, ->(x) { x.to_s.upcase })
# => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }