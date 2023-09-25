=begin 
Suponé que se te da el método que implementaste en el ejercicio 2 para que lo uses a fin de ordenar un 
conjunto de números que te son provistos en forma de arreglo. ¿Cómo podrías invocar el método? 
=end

require_relative 'ej2.rb'

entrada = [10, 9, 1, 2, 3, 5, 7, 8]
# Dada `entrada', invocá a #ordenar utilizando los valores que contiene la variable
#ordenar(entrada) NO funciona, entrada lo está pasando como unico argumento de tipo lista
ordenar(*entrada) # Con * (splat operator) cada elemento de entrada, se pasa como argumento distinto