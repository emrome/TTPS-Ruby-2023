=begin
Escribí una función que encuentre la suma de todos los números naturales múltiplos de 3 y 5
(ambos) que sean menores que un número tope que reciba como parámetro.
=end

def multiplos_de_3_y_5(limit)
    sum = 0
    (5...100).step(5) do | num |
        sum += num if num % 3 == 0
    end
    return sum
end

puts multiplos_de_3_y_5(100)
# => 315
