=begin
 Implementá el Mixin Countable que te permita hacer que cualquier clase cuente la cantidad de
veces que los métodos de instancia definidos en ella es invocado. Utilizalo en distintas clases,
tanto desarrolladas por vos como clases de la librería standard de Ruby, y chequeá los resulta‑
dos. El Mixin debe tener los siguientes métodos:
    1. count_invocations_of(sym): método de clase que al invocarse realiza las tareas necesarias 
    para contabilizar las invocaciones al método de instancia cuyo nombre es sym(un símbolo).

    2. invoked?(sym): método de instancia que devuelve un valor booleano indicando si el método 
    llamado sym fue invocado al menos una vez en la instancia receptora.
    
    3. invoked(sym): método de instancia que devuelve la cantidad de veces que el método
    identificado por sym fue invocado en la instancia receptora. 
=end

module Countable
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def count_invocations_of(*syms)
            syms.each do |sym|
                alias_method "#{sym}_original".to_sym, sym
                
                define_method(sym) do 
                    @method_invocation_count[sym] += 1
                    send("#{sym}_original".to_sym)
                end
                
            end
        end
    end

    def count_invocations
        @method_invocation_count ||= Hash.new(0)
    end

    def invoked(sym)
        @method_invocation_count[sym]
    end

    def invoked?(sym)
        return false if @method_invocation_count.nil?
        @method_invocation_count[sym] > 0
    end


end

class Greeter
    include Countable
    def initialize
        count_invocations
    end
    def hi
        puts 'Hey!'
    end
    def bye
        puts 'See you!'
    end

    count_invocations_of :hi, :bye
end

