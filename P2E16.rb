=begin
método que reciba como parámetros un Hash y un Proc, y que devuelva un
nuevo Hash cuyas las claves sean los valores del Hash recibido como parámetro, y cuyos valores
sean el resultado de invocar el Proc con cada clave del Hash original.
=end

def procesar_hash(hash, proc)
  hash.each_with_object({}) do |(key, _value), hash2|
    hash2[hash[key]] = proc.call(key)
  end
end

hash = { 'clave' => 1, :otra_clave => 'valor' }
resultado = procesar_hash(hash, ->(x) { x.to_s.upcase })
puts resultado.inspect # => { 1 => 'CLAVE', 'valor' => 'OTRA_CLAVE' }

#Proc tiene codigo ejecutable. Son objetos, se pueden pasar por parametro 
#my_proc = Proc.new { |x| x * 2 }
#my_lambda = ->(x) { x * 2 }
#result = my_proc.call(5) 
#def execute_proc(proc)
#  proc.call
#end
#execute_proc(my_proc)

#Un hash es similar al diccionario de py:
#{:nombre => 'maria', :apellido => 'perez'}
#{nombre: 'maria', apellido: 'perez'}
