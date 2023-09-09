=begin 
Escribí un nuevo script, que de manera similar al implementado en el punto anterior haga el
saludo usando un nombre que se provea, pero que en lugar de solicitar que el nombre se ingrese
por entrada estándar, éste se reciba como argumento del script.
=end

if ARGV.empty?
    puts "Por favor, proporciona tu nombre como argumento al script."
else
    puts "¡Hola, #{ ARGV[0] }!"
end
  