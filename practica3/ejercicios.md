# Práctica 3: Excepciones, gemas y Bundler

## Excepciones

### 1. Investigá la jerarquía de clases que resenta Ruby para las excepciones. ¿Para qué se utilizan las siguientes clases?

- ArgumentError: es ocasionada cuando se llama a un método con la cantidad de argumentos erronea
Ej: *ArgumentError: wrong number of arguments (given 2, expected 1)*

- IOError: una operación de entrada-sálida falla.
Ej: *IOError: not opened for writing*

- NameError: cuando el nombre utilizado es inválido o no está definido
Ej: *NameError: undefined local variable or method `foo' for main:Object*

- NotImplementedError: se lanza cuando se intenta llamar a un método que está definido en una clase o módulo, pero ese método aún no ha sido implementado o definido en la subclase o clase concreta que lo hereda. 
Ej: 
```ruby
class SomeAbstractClass
  def some_method
    raise NotImplementedError.new(“method should be implemented in concrete class”)
  end
end
```

- RuntimeError: se lanza cuando ocurre un error en ejecución, por una operación inválida. Es la excepción por defecto en el raise
Ej: *RuntimeError: Runtime Error*

- StandardError: Las clases de excepción que se derivan de StandardError generalmente se consideran excepciones a nivel de aplicación. La cláusula rescue captura por defecto excepciones que son subclases de StandardError.
Ej: **

- StopIteration: sta excepción se genera cuando se intenta iterar más allá del final de un enumerador o un objeto similar a un enumerador utilizando el método Enumerator#next. La excepción *StopIteration* se utiliza para detener la iteración. Indica que has llegado al final de la secuencia y que no hay más elementos para recorrer. *StopIteration* es capturada y manejada por el método loop que se encuentra en el módulo Kernel en Ruby.
Ej:
```ruby
loop do
  begin
    valor = enumerador.next
    puts valor
  rescue StopIteration
    puts "Fin de la enumeración"
    break  # Sal del bucle
  end
end
```

- SystemExit: La excepción SystemExit en Ruby es una clase que representa una solicitud explícita para salir de un programa. Es una subclase de Exception. Se utiliza para indicar que se desea finalizar la ejecución de un programa y generalmente es lanzada mediante el método exit o exit!.
Ej: *exit 0*

- SystemStackError: se lanza en caso de stack overflow. Esto ocurre cuando la cantidad de llamadas recursivas o anidadas en tu programa supera el límite de profundidad de la pila establecido por el sistema operativo o el entorno de ejecución de Ruby.

- TypeError: La excepción TypeError en Ruby se lanza cuando se intenta realizar una operación o usar un valor de un tipo incorrecto. Esto significa que se está tratando de operar con objetos de tipos incompatibles, lo que no es permitido en Ruby.

- ZeroDivisionError: se lanza cuando se intenta dividir un número por cero.
Ej: *ZeroDivisionError: divided by 0*

Jerarquía de Excepciones:
```ruby
Exception
  NoMemoryError
  ScriptError
    LoadError
    NotImplementedError
    SyntaxError
  SecurityError
  SignalException
    Interrupt
  StandardError -- default for rescue
    ArgumentError
      UncaughtThrowError
    EncodingError
    FiberError
    IOError
      EOFError
    IndexError
      KeyError
      StopIteration
    LocalJumpError
    NameError
      NoMethodError
    RangeError
      FloatDomainError
    RegexpError
    RuntimeError -- default for raise
    SystemCallError
      Errno::*
    ThreadError
    TypeError
    ZeroDivisionError
  SystemExit
  SystemStackError

```

### 2. ¿Cuál es la diferencia entre *raise* y *throw*? ¿Para qué usarías una u otra opción?

*raise*, *fail*, *rescue* y *ensure* se utilizan para manejar errores, también conocidos como excepciones. Estas construcciones permiten a los programadores gestionar situaciones excepcionales y tomar medidas específicas cuando ocurre un error durante la ejecución de un programa.

*throw* y *catch* se utilizan para controlar el flujo del programa. Estas construcciones permiten saltar a una ubicación específica en el código en respuesta a una etiqueta de "throw".

```ruby
begin
  # re-raises the current exception
  # (RuntimeError as they are no current exception)
   raise
rescue
   puts 'Tony got rescued.'
end
puts 'Tony returned safely'
```

```ruby
gfg = catch(:divide) do
  # a code block of catch similar to begin 
    number = rand(2) 
    throw :divide if number == 0
    number # set gfg = number if 
    # no exception is thrown 
end
puts gfg 
```

### 3. ¿Para qué sirven *begin .. rescue .. else* y *ensure*? Pensá al menos 2 casos concretos en que usarías estas sentencias en un script Ruby.
- **begin**: Esta es la parte inicial de la estructura de manejo de excepciones. En un bloque begin, colocas el código que se ejecutará y que podría generar una excepción.

- **rescue**: La cláusula rescue se usa para capturar y manejar excepciones que se produzcan en el bloque begin.
Ejemplo: rescue ArgumentError => e captura la excepción ArgumentError y le da el nombre e para que puedas acceder a información sobre la excepción.

- **else**: La cláusula else es opcional y se ejecuta si no se lanza ninguna excepción en el bloque begin. Es decir, si el código dentro de begin se ejecuta con éxito, sin errores, el código dentro de else se ejecutará. Es útil para realizar acciones específicas cuando no se producen excepciones.

- **ensure**: La cláusula ensure también es opcional y se ejecuta siempre, independientemente de si se lanzó una excepción o no. El bloque ensure se ejecuta después de rescue o else.

**Caso 1:** Apertura de una Conexión a una Base de Datos

Supongamos que estás escribiendo un script Ruby que se conecta a una base de datos. En este caso, podrías usar begin .. rescue .. else y ensure para manejar posibles errores de conexión a la base de datos y asegurarte de que la conexión se cierre correctamente.

```ruby
require 'pg'  # Supongamos que estamos utilizando la gema 'pg' para PostgreSQL

begin
  connection = PG.connect(dbname: 'mi_basededatos')
rescue PG::Error => e
  puts "Error de conexión a la base de datos: #{e}"
else
  puts "Conexión exitosa a la base de datos"
ensure
  connection.close if connection
end
```

**Caso 2:** Operaciones en un Sistema de Archivos

Supongamos que estás escribiendo un script Ruby que realiza operaciones en el sistema de archivos, como copiar o eliminar archivos. En este caso, podrías usar begin .. rescue .. else y ensure para manejar errores de archivos no encontrados y asegurarte de que las operaciones de archivo se realicen adecuadamente.

```ruby
file_path = 'mi_archivo.txt'

begin
  content = File.read(file_path)
rescue Errno::ENOENT => e
  puts "Error: El archivo no se encontró - #{e}"
else
  puts "Contenido del archivo: #{content}"
ensure
  # Realizar acciones de limpieza, si es necesario.
end
```


### 4. ¿Para qué sirve retry? ¿Cómo podés evitar caer en un loop infinito al usarla?

Se puede utilizar la sentencia de control retry junto con un bucle de iteración y se repetirá la iteración en curso desde el principio.
Si se usa en un rescue, reinicia desde la primera sentencia del bloque begin.

Para evitar caer en un bucle infinito, se puede definir un contador o una variable que limite la cantidad de veces que se permite el reintentar.

Por ejemplo:

```ruby
reintentos = 0
max_reintentos = 3

begin
  # Código que puede lanzar una excepción
rescue AlgunError => e
  if reintentos < max_reintentos
    reintentos += 1
    retry
  else
    puts "Se superó el número máximo de reintentos."
  end
end
```

### 5. ¿Para qué sirve redo? ¿Qué diferencias principales tiene con retry?

*Redo* reinicia la iteración actual de un bucle, sin evaluar nuevamente la condición. Vuelve a ejecutar el cuerpo del bucle actual desde el principio, sin verificar nuevamente las condiciones del bucle.

Difieren en cuánto se vuelve a ejecutar: "redo" solo repite la iteración actual, mientras que "retry" repite todo el bucle desde el principio.

### 6. Analizá y probá los siguientes métodos, que presentan una lógica similar, pero ubican el manejo de excepciones en distintas partes del código. ¿Qué resultado se obtiene en cada caso? ¿Por qué?
```ruby
def opcion_1
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map do |x|
        x * b
    end
    puts c.inspect
rescue
    0
end
```
**Resultado**: No imprime nada. Se produce la excepcion *undefined method `\*' for nil:NilClass (NoMethodError)* pero como el bloque rescue no está dentro de un bloque begin, la excepción no se maneja y no se asigna un valor 0 a **c**.


```ruby
def opcion_2
    c = begin
            a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
            b = 3
            a.map do |x|
                x * b
            end
        rescue
            0
        end
    puts c.inspect
end
```
**Resultado**: 0. Se produce la excepcion *undefined method `\*' for nil:NilClass (NoMethodError)* se termina el do, y como el *begin*...*rescue* está en la asignación de c, la variable **c** queda con el valor 0.

```ruby
def opcion_3
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map { |x| x * b } rescue 0
    puts c.inspect
end
```
**Resultado**: 0. Se produce la excepcion *undefined method `\*' for nil:NilClass (NoMethodError)*
Es lo mismo que lo anterior, pero en vez de usar un bloque *begin*...*rescue*, utiliza *rescue* en una sola línea, pero fuera del bloque, por tanto queda **c** con el valor 0. Ruby también permite usar rescue en línea como una forma abreviada y concisa para manejar excepciones en una sola línea de código.

```ruby
def opcion_4
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map { |x| x * b rescue 0 }
    puts c.inspect
end
```
**Resultado**: [3, 0, 9, 0, 15, 0, 21, 0, 27, 0]. Se produce la excepcion *undefined method `\*' for nil:NilClass (NoMethodError)*. Es lo mismo que el anterior, pero ahora *rescue* se encuentra dentro del bloque, por tanto no termina con el bloque si surge una excepción, sino que reemplaza el valor de x por 0, si se produce una excepción en esa iteración.
Por lo tanto, permite realizar el map para todo elemento, y no cortarlo ante una excepción.

### 9. Dado el siguiente código:

```ruby
def fun3
  puts "Entrando a fun3"
  raise RuntimeError, "Excepción intencional"
  puts "Terminando fun3"

rescue NoMethodError => e
  puts "Tratando excepción por falta de método"
rescue RuntimeError => e
  puts "Tratando excepción provocada en tiempo de ejecución"
rescue
  puts "Tratando una excepción cualquiera"
ensure
  puts "Ejecutando ensure de fun3"
end

def fun2(x)
  puts "Entrando a fun2"
  fun3
  a = 5 / x
  puts "Terminando fun2"
end

def fun1(x)
  puts "Entrando a fun1"
  fun2 x
rescue
  puts "Manejador de excepciones de fun1"
  raise
ensure
  puts "Ejecutando ensure de fun1"
end

begin
  x = 0
  begin
    fun1 x
  rescue Exception => e
    puts "Manejador de excepciones de Main"
    if x == 0
      puts "Corrección de x"
      x = 1
      retry
    end
  end
  puts "Salida"
end
```

1. Seguí el flujo de ejecución registrando la traza de impresiones que deja el programa, analizando por qué partes del código va pasando y justificando esos pasos.

- *Entrando a fun1*
- *Entrando a fun2*
- *Entrando a fun3*
- *Tratando excepción provocada en tiempo de ejecución*
- *Ejecutando ensure de fun3*
- *Manejador de excepciones de fun1*
- *Ejecutando ensure de fun1*
- *Manejador de excepciones de Main*
- *Corrección de x*
- *Entrando a fun1*
- *Entrando a fun2*
- *Entrando a fun3*
- *Tratando excepción provocada en tiempo de ejecución*
- *Ejecutando ensure de fun3*
- *Terminando fun2*
- *Ejecutando ensure de fun1*
- *Salida*


2. ¿Qué pasaría si se permuta, dentro de fun3, el manejador de excepciones para RuntimeError y el manejador de excepciones genérico (el que tiene el rescue vacío)?

Tomaria el camino de rescue generico en caso de que el error no se *NoMethodError*, ya que *RuntimeError* es subclase de la por defecto (*StandardError*)

3. ¿El uso de retry afectaría el funcionamiento del programa si se mueve la línea x = 0 dentro del segundo begin (inmediatamente antes de llamar a fun1 con x)?

Sí, ya que el retry ejecuta desde el begin, por lo tanto asignaria nuevamente 0 y quedaria en un loop infinito.

## Librerías reutilizables en Ruby (Gemas) y Bundler

### 11. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura general suele tener?

Una gema es un formato simple para publicar y compartir código Ruby.
Cada gema tiene un nombre, versión y plataforma.

Estructura general de una gema:
  - Archivo .gemspec: Este archivo define los metadatos de la gema, como su nombre, versión y dependencias.
  - Directorio lib: Aquí se coloca el código Ruby principal de la gema.
  - Directorio spec: Contiene pruebas (tests) para la gema, si se siguen buenas prácticas de desarrollo.
  - Directorio bin (opcional): Puede contener archivos ejecutables que se instalan como comandos en el sistema.
  - Directorio doc (opcional): Documentación relacionada con la gema.
  - Directorio ext (opcional): Código C o código nativo de extensión de la gema.
  - Archivos README y LICENSE: Documentación y licencia de la gema.
  - Otros archivos y directorios personalizados: Pueden contener recursos adicionales o configuraciones específicas de la gema.

### 12. ¿Cuáles son las principales diferencias entre el comando gem y Bundler? ¿Hacen lo mismo?

*Bundler* es un administrador de dependencias y un manejador de paquetes específicamente diseñado para gestionar las dependencias de una aplicación Ruby. Su función principal es resolver, instalar y gestionar las gemas y sus versiones en el contexto de un proyecto específico. *Bundler* se asegura de que una aplicación tenga acceso a las versiones correctas de las gemas que necesita.

*gem* es una herramienta más general que se utiliza para administrar gemas a nivel de sistema. Se puede usar *gem* para instalar, actualizar y eliminar gemas en un sistema Ruby, pero no se encarga de gestionar automáticamente las dependencias de las aplicaciones.

*gem* es una herramienta para gestionar gemas a nivel de sistema, mientras que *Bundler* se enfoca en la gestión de dependencias de una aplicación Ruby específica. A menudo, se utilizan juntas en un proyecto Ruby: Bundler se encarga de administrar las dependencias de la aplicación, y gem se utiliza para instalar gemas en el sistema si es necesario.

### 13. ¿Dónde almacenan las gemas que se instalan con el comando gem? ¿Y aquellas instaladas con el comando bundle? Tip: gem which y bundle show.

Las gemas que se instalan con el comando **gem** se almacenan en una ubicación global en el sistema. La ubicación exacta puede variar según el sistema operativo y la configuración de Ruby, pero generalmente se almacenan en directorios específicos del sistema donde Ruby puede encontrarlas. Para averiguar la ubicación de una gema instalada con **gem**, puedes utilizar el comando *gem which*.

Las gemas que se instalan con el comando **bundle** se almacenan en un directorio específico dentro del proyecto. Por defecto, **Bundler** crea un directorio llamado vendor en el proyecto y almacena las gemas allí. Puedes ver la ubicación de las gemas instaladas con Bundler utilizando el comando *bundle show*.

### 14. ¿Para qué sirve el comando gem server? ¿Qué información podés obtener al usarlo?

El comando *gem server* en Ruby se utiliza para iniciar un servidor web local que sirve como una interfaz gráfica para explorar y gestionar las gemas instaladas en tu sistema. Al ejecutar *gem server*, se inicia un servidor web que te permite acceder a la documentación y la información de todas las gemas instaladas en tu sistema, así como a la documentación de Ruby estándar.

Al usar gem server, puedes obtener la siguiente información:
- Documentación de gemas
- Lista de gemas
- Documentación de Ruby estándar
- Búsqueda de gemas
 
El servidor se ejecuta en un puerto específico (por defecto, el puerto 8808), y puedes acceder a la interfaz gráfica utilizando un navegador web. Por ejemplo, puedes abrir tu navegador y navegar a http://localhost:8808 para acceder a la interfaz del servidor.


### 15. Investigá un poco sobre Semantic Versioning (o SemVer). ¿Qué finalidad tiene? ¿Cómo se compone una versión? ¿Ante qué situaciones debería cambiarse cada una de sus partes?

Semantic Versioning, o SemVer en resumen, es un sistema de numeración de versiones para software que tiene como objetivo proporcionar una forma clara y coherente de especificar cambios y actualizaciones en un proyecto. La finalidad principal de SemVer es permitir que los desarrolladores y usuarios de software comprendan fácilmente el impacto de una nueva versión de un proyecto y tomar decisiones informadas sobre cuándo y cómo actualizar.

__Una versión SemVer consta de tres partes principales: `X.Y.Z`, donde:__

- `X` (número mayor): Se incrementa cuando se realizan cambios incompatibles con versiones anteriores del software. Por ejemplo, se aumenta si se realizan cambios que rompen la compatibilidad con versiones anteriores y requieren modificaciones significativas en el código del usuario.

- `Y` (número menor): Se incrementa cuando se agrega funcionalidad de una manera compatible con versiones anteriores. Por ejemplo, se aumenta cuando se agregan nuevas características o mejoras que no afectan la compatibilidad con versiones anteriores.

- `Z` (número de revisión): Se incrementa para correcciones de errores y parches menores que son compatibles hacia atrás. Por ejemplo, se aumenta cuando se solucionan errores sin introducir nuevas características ni cambios significativos.

__El cambio de cada parte tiene implicaciones específicas:__

- Cambio en `X`: Implica que se han realizado cambios importantes y no compatibles hacia atrás. Los usuarios pueden necesitar modificar su código para que funcione con la nueva versión.

- Cambio en `Y`: Indica que se han agregado nuevas características de manera compatible con versiones anteriores. Los usuarios pueden beneficiarse de las nuevas características sin preocuparse por la compatibilidad.

- Cambio en `Z`: Refleja correcciones de errores y parches menores. Los usuarios pueden actualizar con seguridad para obtener correcciones sin cambios significativos en el comportamiento.

### 17. Utilizando el proyecto creado en el punto anterior como referencia, contestá las siguientes preguntas:
1. ¿Qué finalidad tiene el archivo Gemfile?

***Gemfile*** es un archivo de Ruby que define las dependencias de tu proyecto en Ruby. Es un archivo creado para describir las dependencias de gemas necesarias para ejecutar un programa en Ruby.

2. ¿Para qué sirve la directiva source del Gemfile? ¿Cuántas veces puede estar en un mismo archivo?

Los Gemfiles requieren al menos una fuente de gemas, en forma de URL para un servidor de RubyGems.

La directiva source puede estar presente una sola vez en un archivo Gemfile. Define la ubicación de donde Bundler debe descargar las gemas para el proyecto. Esta especificación es única en un Gemfile y generalmente se ubica al principio del archivo. Si se colocara más de una vez, solo se tomaría en cuenta la última declaración source en el Gemfile.

3. Acorde a cómo agregaste la gema colorputs, ¿qué versión se instaló de la misma? Si mañana se publicara la versión 7.3.2, ¿esta se instalaría en tu proyecto? ¿Por qué? ¿Cómo podrías limitar esto y hacer que sólo se instalen releases de la gema en las que no cambie la versión mayor de la misma con respecto a la que tenés instalada ahora?

Al no especificar la version, se instala la última hasta el momento. 
Si sale otro versión, no se instalaría sola, deberia realizar un **bundle update**.

Para limitar un version de una gema hay que agregar:
*= 7.3*

Despues se puede especificar:

- ***>= 1.1.0***: Esta restricción significa *"mayor o igual a la versión 1.1.0"*. Cualquier versión que sea igual o superior a 1.1.0 será aceptada. Por ejemplo, versiones como 1.1.0, 1.2.0, 2.0.0, 3.0.0, etc., serían aceptadas por esta restricción.

- ***~> 3.1.2***: Esta restricción, utilizando la notación de tilde (~>), especifica *"versiones dentro de la serie 3.1.x pero mayores o iguales a 3.1.2 y menores a 3.2.0"*. En este caso, serían aceptadas versiones como 3.1.2, 3.1.3, 3.1.9, pero no 3.2.0 ni versiones posteriores, ya que cambian la versión menor.

4. ¿Qué ocurrió la primera vez que ejecutaste prueba.rb? ¿Por qué?

Error: *'require' : cannot load such file -- colorputs (LoadError)*, está intentando requerir (usar) la gema colorputs en un archivo de Ruby, pero esta gema no está instalada en el entorno Ruby. 

5. ¿Qué cambió al ejecutar bundle install?

Al ejecutar el bundle install, instaló la gema y sus dependencias y creó el Gemfile.lock.
Luego pude ejecutar prueba.rb sin error.

6. ¿Qué diferencia hay entre bundle install y bundle update?

- **bundle install** instala las gemas especificadas y sus dependencias tal como están definidas en el Gemfile y Gemfile.lock.

- **bundle update** actualiza las gemas a sus versiones más recientes permitidas por las restricciones en el Gemfile.

7. ¿Qué ocurrió al ejecutar prueba_dos.rb de las distintas formas enunciadas? ¿Por qué? ¿Cómo modificarías el archivo prueba_dos.rb para que funcione correctamente sin importar de cuál de las dos maneras indicadas es ejecutado?

***ruby prueba_dos.rb:***
El error uninitialized constant Bundler (NameError) que estás experimentando al ejecutar el archivo prueba_dos.rb con el comando ruby prueba_dos.rb indica que el código no puede encontrar la constante Bundler. Esto puede suceder porque Bundler no se carga automáticamente en tu entorno al ejecutar el archivo directamente con ruby.


***bundle exec ruby prueba_dos.rb:***
Al utilizar Bundler.require en tu código, estás indicando que el programa requiere la carga de todas las gemas especificadas en el Gemfile. Cuando ejecutas bundle exec ruby prueba_dos.rb, Bundler está en uso, por lo que carga todas las gemas necesarias antes de ejecutar el script, lo que evita el error.


**Para evitar el error:**
Cargar manualmente Bundler al inicio del script:
```ruby
require 'bundler/setup'
Bundler.require
puts "Chau!", :red
```
