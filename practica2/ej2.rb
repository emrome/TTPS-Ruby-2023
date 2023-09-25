=begin
 Modificá el método anterior para que en lugar de recibir un arreglo como único parámetro, reciba 
todos los números como parámetros separados. 
=end
def ordenar(*args)
  return args.sort
end

# puts ordenar(1, 4, 6, 2, 3, 0, 10)
# => 0, 1, 2, 3, 4, 6, 10