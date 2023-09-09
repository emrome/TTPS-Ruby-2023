# Práctica 1: Sintaxis y Conceptos Básicos

## Taller de Tecnologías de Producción de Software - Ruby
## Cursada 2023

### Ejercicio 1. Investigá y probá en un intérprete de Ruby (**irb**, por ejemplo) cómo crear objetos de los siguientes tipos básicos, tanto mediante el uso de literales como utilizando el constructor new (cuando sea posible):

- **Symbol**: son Strings **inmutables**, por tanto dos simbolos con mismo valor apuntan al mismo objeto y al mismo lugar en la memoria.
```ruby
# Crear un symbol utilizando un literal
simbolo = :soy_un_simbolo
```

- **String**: 
```ruby
# Crear un string utilizando un literal
my_string = "This is a string"

# Crear un string utilizando el constructor new
another_string = String.new("This is a string")
```

- **Array**: 
```ruby
# Crear un array utilizando un literal
my_array = [1, 2, 3, 4, 5]

# Crear un array utilizando el constructor new
another_array = Array.new(3, "valor inicial para todos")
```

- **Hash**:
```ruby
# Crear un hash utilizando un literal
my_hash = { "key1" => "value1", "key2" => "value2" }

# Crear un hash utilizando el constructor new
another_hash = Hash.new("Valor para cuando se accede a clave q no existe")
another_hash["key1"] = "value1"
another_hash["key2"] = "value2"
```
### Ejercicio 2. ¿De qué forma(s) se puede convertir un objeto (cualquiera fuere su tipo o clase) en String?

1. *Método to_s*: La mayoría de las clases en Ruby implementan el método to_s, que devuelve una representación en cadena del objeto.
```ruby
objeto = 42
cadena = objeto.to_s
```
2. *Método String()*: el método global String() para convertir un objeto en una cadena. Este método intentará llamar al método to_s del objeto si está definido.
```ruby
objeto = 3.14
cadena = String(objeto)
```

### Ejercicio 3. ¿De qué forma(s) se puede convertir un objeto **String** en un símbolo?

Para convertir un objeto de tipo String en un símbolo (Symbol) en Ruby, existe el método *to_sym*. Este método está disponible en las instancias de la clase String.
```ruby
cadena = "ejemplo"
simbolo = cadena.to_sym
```

### Ejercicio 4. ¿Qué devuelve la siguiente comparación? ¿Por qué?
```ruby
'TTPS Ruby'.object_id == 'TTPS Ruby'.object_id
```

La comparación devuelve **false**, ya que son dos objectos String distintos. Aunque ambas cadenas tienen el mismo contenido ('TTPS Ruby'), cada una es un objeto independiente en memoria y, por lo tanto, tiene un identificador de objeto (object_id) único.

### Ejercicio 10. ¿Cuál es el valor de retorno del siguiente código?
```ruby
[:upcase, :downcase, :capitalize, :swapcase].map do |meth|
"TTPS Ruby".send(meth)
end
```
Retorna **["TTPS RUBY", "ttps ruby", "Ttps ruby", "ttps rUBY"]**. El método send, cuando se utiliza con un símbolo, permite enviar dinámicamente al objeto (por ejemplo, un String) el método que está representado por ese símbolo, lo que resulta en la ejecución del método en el objeto con los efectos esperados.


### Ejercicio 11. Tomando el ejercicio anterior como referencia, ¿en qué situaciones usarías los métodos **send** y **public_send** definidos en la clase Object? ¿Cuál es la principal diferencia entre esos dos métodos?

La principal diferencia entre send y public_send es la visibilidad de los métodos que pueden invocar. send puede invocar cualquier método, mientras que public_send solo puede invocar métodos públicos. El uso de public_send se recomienda en la mayoría de las situaciones para garantizar una programación más segura y coherente.

### Ejercicio 20. Investigá qué métodos provee Ruby para:
- Obtener la lista de ancestros (superclases) de una clase.

El método ***ancestors*** para obtener una lista de las clases y módulos en la jerarquía de ancestros de una clase.

- Conocer la lista de métodos de una clase.

El método ***methods*** en una clase para obtener una lista de todos los métodos públicos de esa clase, incluidos los heredados.

- Conocer la lista de métodos de instancia de una clase.

El método ***instance_methods*** en una clase para obtener una lista de los métodos de instancia públicos de esa clase.

- Conocer las variables de instancia de una clase.

El método ***instance_variables*** para obtener una lista de las variables de instancia de un objeto.

- Obtener el valor de una variable de instancia de un objeto(sin utilizar un método generado con **attr_reader** o similar) accediéndolo desde fuera de éste.

Con el método ***instance_variable_get(:@variable_instancia)***

- Establecer el valor de una variable de instancia de un objeto (sin utilizar un método gene‑
rado con **attr_writer** o similar) desde fuera de éste.

el método ***instance_variable_set(:@variable_instancia, 100)*** para establecer el valor de una variable de instancia en un objeto.
