=begin
Dada la siguiente clase abstracta GenericFactory, implementá subclases de la misma que
permitan la creación de instancias de dichas clases mediante el uso del método de clase .
create, de manera tal que luego puedas usar esa lógica para instanciar objetos sin invocar
directamente el constructor new 

=end
class GenericFactory
    def self.create(**args)
        new(**args)
    end
    def initialize(**args)
        raise  NotImplementedError
    end
end

class CarFactory < GenericFactory
    def self.create(**args)
        new(**args)
    end
    def initialize(**args)
        super(**args)
    end
end