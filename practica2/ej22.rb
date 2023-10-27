
class NoEsUnaPalabra < StandardError
    def initialize(palabra)
        super(msg="#{palabra} no es una palabra")
    end
end
class EsUnStringVacio < StandardError
    def initialize(msg="Es un string vacío")
        super
    end
end

class Palabra
    attr_accessor :palabra
    def initialize(palabra)
        # strip saca espacios al inicio y al final
        if (palabra.strip.empty?)
            raise EsUnStringVacio.new
        elsif (palabra.match(/^[A-Za-z]+$/).nil?)
            raise NoEsUnaPalabra.new(palabra)
        else
            @palabra = palabra
        end
    end

    def vocales
        # Retorna vocales que contiene la palabra que representa, sin repeticiones
        return @palabra.scan(/[aeiouAEIOU]/).uniq
    end

    def consonantes
        # Retorna las consonantes que contiene la palabra, sin repeticiones
        # [^aeiouAEIOU] the ^ negates the character class
        return @palabra.scan(/[^aeiouAEIOU]/).uniq
    end

    def longitud
        return @palabra.length
    end

    def es_panvocalica?
        # Contiene las cinco vocales
        return self.vocales.length == 5
    end

    def es_palindroma?
        # Si se lee igual en un sentido que en otro, teniendo al menos 3 letras
        return false unless (self.longitud >= 3)
        return @palabra == @palabra.reverse
    end

    def gritando
        return @palabra.upcase
    end

    def en_jaquer
        # Cambia las vocales por números:
        # ("a" por "4", "e" por "3", "i" por "1", "o" por "0" y "u" por "2")
        subs = {
            "a" => "4",
            "e" => "3",
            "i" => "1",
            "o" => "0",
            "u" => "2"
        } # porque con a: "4" no funciona?
        return @palabra.gsub(/[aeiouAEIOU]/, subs)
    end
end

palabra = Palabra.new("palabra")

puts palabra.vocales
puts palabra.consonantes
puts palabra.longitud
puts palabra.es_panvocalica?
puts palabra.es_palindroma?
puts palabra.gritando
puts palabra.en_jaquer
