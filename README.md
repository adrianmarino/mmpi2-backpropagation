#Test MMPI2#

El test MMPI-2 es un cuestionario que permite determinar varias estados psicologicos de un paciente. Esta aplicación determina el nivel de depresión del paciente utilizando una red neuronal back-propagation. 

# Requerimientos #

Para instalar la aplicación es necesario realizar los siguientes pasos:

## Instalación de Ruby ##
* rvm (Linux)
* RubyIntaller (Windows).

## Descargar dependencias ##
Con el siguiente comando parado en el directorio principal de la aplicación:

```
bundle install
```

**Nota:** Si bundle no esta instalado correr el siguiente comando:
   
```
gem install bundle
```

#Uso#

## Entrenar y guardar la red ##

```
cd bin
ruby train_and_save_net.rb 100
```

Este comando genera 100 tests MMPI-2 con respuestas aleatorias y entrena la red con 10 iteraciones. Finalmente, guarda la red entrenada en el archivo  net_trained.dat. Una vez que tenemos persistida la red, ya no hace falta entrenarla cada vez que necesitamos usarla.

## Probar la red ##

El siguente comando prueba la red (ya entrenada en el paso anterior) generando un caso aleatorio para el cual ya se conoce su resultado.

```
cd bin
ruby test_net.rb
```

## Realizar el test MMPI2 ##

Para realizar el test hay que ejecutar el siguiente comando:

```
cd bin
ruby mmpi2_test.rb
```

Nos ira haciendo una serie de preguntas para finalmente calcular nuestro nivel de depresión.

## Entrenar y probar la red en un solo paso ##

Es posible entrenar y probar la red en un solo paso, aunque puede demorar algún tiempo dependiendo del cuantos test se utilicen para entrenar la red.

```
cd bin
ruby train_and_test_net.rb 100
```

Donde 100 es el número de tests MMPI-2 utilizados para entrenar la red.


# Configuración #

La red se puede configurar desde el archivo config/net_configuration.rb. Veamos su contenido:

```ruby
module NetConfiguration
	NEURON_LEVELS = [32,32,5]
	# NEURON_LEVELS = [32,32,20] --> Comentado
	LEARNING_RATE = 0.25
	MOMENTUM = 0.1
	MAX_ERROR = 0.001
	OUTPUT_CONVERTER = BinaryOutputConverter.new 5
	# OUTPUT_CONVERTER = BinaryOutputConverter.new 20+1 --> Comentado
end
```

* **Neuron Levels:** Aqui se configura cuantas neuronas hay en cada nivel y por ende el numero de niveles de la red. En el ejemplo se puede ver que tenemos un nivel de entrada de 32 neuronas, uno intermedio de 32 y la salida tiene 5 neuronas.
* **Learning Rate:** Es le factor de aprendizaje de la red. Puede variar entre 0,05 y 0,25.
* **Momentum:** Cuanto más grande es el Momento, la convergencia es más rápida. Por defecto es 0,1.
* **Error:** El máximo error de la red en la etapa de entrenamiento.
El error estra expresado como: Error = 0.5 * sum( (expected_value-output_value)**2 )
* **Output converter:** Dependiendo la cantidad de salidas hay dos estrategia:
	1. **BinaryOutputConverter:** Usada para una salida binaria de 5 neuronas.
	2. **OutputByNumberConverter:** Usada para una salida por cada valor posible. Por ejemplo: si tengo 20 valores posible, tendre 20 neuronas de salida.


# Archivo log #

existe un solo log el cual se encunetra en el directorio log. Para leerlo a medida que se va generarndo se puede usar el siguieten comando:

```
tail -f log/mmpi2.log
```

# Correr todos los tests #

Para correr los tests desde el directorio de la aplicación ejecutar el 
siguiente comando: 

```
rake test
```

## License

mmpi2-backpropagation is released under the [MIT License](http://www.opensource.org/licenses/MIT).
