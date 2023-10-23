=begin
Modelá con una jerarquía de clases la siguiente situación:

Los usuarios finales de una aplicación tienen los atributos básicos que permiten identificarlos
(usuario, clave, email ‑ los que consideres necesarios), y un rol que determina qué operaciones
pueden hacer. Los roles posibles son: Lector, Redactor, Director y Administrador. 

Cada usuario gestiona Documentos según su rol le permita, acorde a las siguientes reglas:
• Los Lectores pueden ver cualquier Documento que esté marcado como público.
• Los Redactores pueden hacer todo lo que los Lectores y además pueden cambiar el contenido 
de los Documentos que ellos crearon.
• Los Directores pueden ver y cambiar el contenido de cualquier documento (público o pri‑
vado, y creado por cualquier usuario), excepto aquellos que hayan sido borrados.
• Los Administradores pueden hacer lo mismo que los directores y además pueden borrar
Documentos.

Utilizando el siguiente código para la clase Documento, implementá las clases que consideres
necesarias para representar a los usuarios y sus roles, completando la funcionalidad aquí pre‑
sente:

=end
class Documento
    attr_accessor :creador, :contenido, :publico, :borrado
    def initialize(usuario, publico = true, contenido = '')
        self.creador = usuario
        self.publico = publico
        self.contenido = contenido
        self.borrado = false
    end

    def borrar
        self.borrado = true
    end

    def puede_ser_visto_por?(usuario)
        usuario.puede_ver? self
    end

    def puede_ser_modificado_por?(usuario)
        usuario.puede_modificar? self
    end

    def puede_ser_borrado_por?(usuario)
        usuario.puede_borrar? self
    end
end

class Usuario
    attr_reader :nombre, :clave, :email
    attr_accessor :rol
  
    def initialize(nombre, clave, email)
        @nombre = nombre
        @clave = clave
        @email = email
        @rol = Lector.new
    end

    def puede_ver?(documento)
      rol.puede_ver? documento
    end

    def puede_modificar?(documento)
      rol.puede_modificar? documento
    end

    def puede_borrar?(documento)
      rol.puede_borrar? documento
    end
end

class Rol
    private_class_method :new
    def puede_ver?(documento)
        false
    end
    
    def cambiar_contenido(documento, nuevo_contenido)
        documento.contenido = nuevo_contenido if documento.publico
    end
    
    def borrar_documento(documento)
        documento.borrado = true
    end
end


class Lector < Rol
    def puede_ver?(documento)
        documento.publico 
    end
end

class Redactor < Rol

end

class Administrador < Rol

end

class Director < Rol

end