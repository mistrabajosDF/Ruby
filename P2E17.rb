=begin
método que reciba parámetros y un bloque, y que al ser
invocado ejecute el bloque recibido pasándole todos los parámetros que se recibieron encapsulando 
todo esto con captura de excepciones de manera tal que si en la ejecución del bloque
se produce alguna excepción, proceda de la siguiente forma:
• RuntimeError,"Hay algo mal que no anda bien", y retornar :rt.
• NoMethodError, "Y este método?" más el mensaje original de la excepción que se produjo, y retornar :nm.
• Otra excepción, "Y ahora?", y relanzar la excepción que se produjo.
En caso que la ejecución del bloque sea exitosa, deberá retornar :ok.
=end

def metodo1(*args, &block)
  begin
    block.call(*args)
    :ok
  rescue RuntimeError
    puts "Hay algo mal que no anda bien"
    :rt
  rescue NoMethodError => e
    puts "Y este método? #{e.message}"
    :nm
  rescue => e
    puts "Y ahora?"
    raise e  # Relanza la excepción
  end
end

resultado = metodo1([5, 10]) { |valores| valores.each { |x| puts x } }
resultado = metodo1(5, 10) { |*valores| valores.each { |x| puts x } } #Dos formas de hacer lo mismo. Puede recibir tamb array
puts "Esto tiene que decir ok: " + resultado.to_s  # => :ok

resultado = metodo1 do
  raise "-"
end
puts "Esto tiene que decir rt: " + resultado.to_s  # => :rt

resultado = metodo1(5) do |a|
  a.undefined_method
end
puts "Esto tiene que decir nm: " + resultado.to_s  # => :nm

resultado = metodo1 do
  raise ArgumentError, "Los gatitos mandan"  # Esto generará una excepción diferente
end