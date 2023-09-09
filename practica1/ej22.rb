=begin
Creá otra función, similar a la anterior, que busque los números naturales múltiplos de N núme‑
ros enteros que recibirá como parámetro en un arreglo
=end

def multiplos_de(numbers, limit)
    begin
        sum = 0
        (1...limit).each do |num|
            if numbers.all? { |n| num % n == 0 }
                sum += num
            end
        end
        return sum
    rescue ZeroDivisionError => e
        puts "Error: DIVISION POR 0"
    end
end

puts multiplos_de([3, 5], 100)
# => 315
puts multiplos_de([3, 5, 17, 28, 65], 100_000)
# => 92820