## Práctica 2: Clases, módulos, métodos, bloques, enumeradores y excepciones
### Taller de Tecnologías de Producción de Software ‑ Ruby
### Cursada 2023

#### 8. ¿Qué diferencia hay entre el uso de include y extend a la hora de incorporar un módulo en una clase?
1. Si quisieras usar un módulo para agregar métodos de instancia a una clase, ¿qué forma usarías a la hora de incorporar el módulo a la clase?
2. Si en cambio quisieras usar un módulo para agregar métodos de clase, ¿qué forma usarías en ese caso?

#### 14. Analizá el siguiente script e indicá:
```ruby
VALUE = 'global'

module A
    VALUE = 'A'
    class B
        VALUE = 'B'
        def self.value
            VALUE
        end

        def value
            'iB'
        end
    end

    def self.value
        VALUE
    end
end

class C
    class D
        VALUE = 'D'
        def self.value
            VALUE
        end
    end

    module E
        def self.value
            VALUE
        end
    end

    def self.value
        VALUE
    end
end

class F < C
    VALUE = 'F'
end
```
1. ¿Qué imprimen cada una de las siguientes sentencias? ¿De dónde está obteniendo el valor?
    1. puts A.value: imprime A, accede al método de clase value, el cual devuelve la variable global

    2. puts A::B.value: imprime B, accede al espacio de nombres de A y accede al método de clase *value* de B, el cual devuelve la variable global deC::D.value B

    3. puts C::D.value: imprime D, accede al espacio de nombres de C y accede al método de clase *value* de D, el cual devuelve la variable global de D

    4. puts C::E.value: imprime global, llama al método *value* del módulo E, el cuál referencia a *VALUE="global"*

    5. puts F.value: imprime global, llama al método de clase *value* que hereda de la clase C. Pero al llamarlo obtiene el valor *VALUE="global"* porque es el la variable referenciada en su definición. 


2. ¿Qué pasaría si ejecutases las siguientes sentencias? ¿Por qué?
    1. puts A::value: obtiene el valor de A
    2. puts A.new.value: te da error de método indefinido *new*, ya que no se puede instanciar un módulo
    3. puts B.value: B no existe fuera del modulo A, deberias acceder como **A::B.value**
    4. puts C::D.value: devuelve D, la variable VALUE de la clase D
    5. puts C.value: devuelve *global*
    6. puts F.superclass.value: devuelve *global* porque accede al métdo value de C.

#### 19. ¿Qué son los lazy enumerators? ¿Qué ventajas ves en ellos con respecto al uso de los enumeradores que no son lazy? 
### **Tip: Analizalo pensando en conjuntos grandes de datos**

Los enumeradotors que no son lazys, al invocarlo, primero se generan los datos y luego se hace la operación, ej selección. Los enumeradores que no son "lazy" generan y almacenan todos los datos en memoria cuando se crean. Esto significa que se evalúan inmediatamente y ocupan espacio en memoria. En cambio, los lazy enumerators permite construir cadenas de operaciones sin evaluarlas inmediatamente, y evaluar valores a medida que se necesitan. Los valores se calculan y generan solo cuando se necesitan, lo que puede ahorrar memoria y tiempo de procesamiento.
Ruby ofrece "lazy enumerators" para trabajar con colecciones de manera más eficiente y evitar el cálculo innecesario de valores.