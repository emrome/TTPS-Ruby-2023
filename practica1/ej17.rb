=begin 
Escribí un script en Ruby que le pida a quien lo ejecute su nombre, el cual ingresará por en‑
trada estándar (el teclado), y que lo utilice para saludarl@ imprimiendo en pantalla ¡Hola, <
nombre>!.
=end

puts "Por favor, ingresá tu nombre:"
name = gets.chomp #Saca salto de linea del gets
puts "¡Hola, #{ name }!"

#$ ruby script.rb
#Por favor, ingresá tu nombre:
#R2-D2
#¡Hola, R2-D2!
