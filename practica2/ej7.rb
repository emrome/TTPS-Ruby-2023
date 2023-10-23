=begin
Luego de implementar el ejercicio anterior, modificalo para que los usuarios implementen el
método #to_s que debe retornar el atributo usuario (o email, según hayas decidido utilizar) y
el rol que posee.
=end

lector.to_s
# => "elhector@example.org (Lector)"
administrador.to_s
# => "admin@example.org (Administrador)"