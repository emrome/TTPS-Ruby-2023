=begin 
Implementá el método cuanto_falta? que opcionalmente reciba como parámetro un objeto
Time y que calcule la cantidad de minutos que faltan para ese momento. Si el parámetro de
fecha no es provisto, asumí que la consulta es para la medianoche de hoy
=end
require 'date'
def cuanto_falta? (moment = Time.new(Time.now.year, Time.now.month, Time.now.day, 23, 59, 59))
    return "Faltan #{((moment - Time.now) / 60).to_i} minutos"
end

puts cuanto_falta? Time.new(2032, 12, 31, 23, 59, 59)
# => Retorna la cantidad de minutos que faltan para las 23:59:59 del 31/12/2032
puts cuanto_falta?
# => Retorna la cantidad de minutos que faltan para la medianoche de hoy