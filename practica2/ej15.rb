=begin  
Escribí un método da_nil? que reciba un bloque, lo invoque y retorne si el valor de retorno del
bloque fue nil
=end

def da_nil? &block
    return false unless block
    yield.nil?
end
