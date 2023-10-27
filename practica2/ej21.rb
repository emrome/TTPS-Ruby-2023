=begin
Escribí un enumerador que genere series de números primos con algún tope, ya sea que se detenga 
al alcanzar o superar un valor
=end

def primos(limit)
    Enumerator.new do |caller|
        num=1
        while num <= limit do
            divisor = 2
            while ((divisor < num) & (num % divisor != 0))
                divisor += 1
            end
            if (divisor >= num)
                caller.yield num
            end
            num += 1
        end
    end
end

mis_primos = primos(100)
puts mis_primos.first(60)