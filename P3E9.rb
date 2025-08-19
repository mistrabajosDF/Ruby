def fun3
  puts "Entrando a fun3" #Tercer print-duodecimo print
  raise RuntimeError, "Excepción intencional" #Levanta la que trata en el cuarto print
  puts "Terminando fun3"
rescue NoMethodError => e
  puts "Tratando excepción por falta de método"
rescue RuntimeError => e
  puts "Tratando excepción provocada en tiempo de ejecución" #Cuarto print-decimotercer print
rescue
  puts "Tratando una excepción cualquiera"
ensure
  puts "Ejecutando ensure de fun3" #Quinto print-decimocuarto print
end

def fun2(x)
  puts "Entrando a fun2" #Segundo print-undecimo print
  fun3
  a = 5 / x
  puts "Terminando fun2" #15º print
end

def fun1(x)
  puts "Entrando a fun1" #primer print-decimo print
  fun2 x
rescue
  puts "Manejador de excepciones de fun1" #Sexto print. Esta agarrando la division de 0 de f2
  raise
ensure
  puts "Ejecutando ensure de fun1" #Septimo print-16ª print
end

begin
  x = 0
  begin
    fun1 x #Llama a fun 1
  rescue Exception => e
    puts "Manejador de excepciones de Main" #Octavo print
    if x == 0
      puts "Corrección de x" #Noveno print
      x = 1
      retry #Hace arrancar el bucle de nuevo
    end
  end
  puts "Salida" #Ultimo print
end


#¿Qué pasaría si se permuta, dentro de fun3, el manejador de excepciones para RuntimeError y el manejador de excepciones 
#genérico (el que tiene el rescue vacío)?
#El generico toma la excepcion de runtime e imprime "Tratando una excepción cualquiera"

#¿El uso de retry afectaría el funcionamiento del programa si se mueve la línea x = 0 dentro del segundo begin 
#(inmediatamente antes de llamar a fun1 con x)?
#Si, haria un bucle infinito porque vuelve a poner x en 0