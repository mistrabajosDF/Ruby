=begin
función rot13 que encripte un String recibido como parámetro utilizando
el algoritmo ROT13
=end

def rot13(text)
  text.tr("A-Za-z", "N-ZA-Mn-za-m")
end

puts (rot13 ("Los gatitos son lo mejor."))

#tr realiza una sustitución de caracteres.
#"A-Za-z" especifica el rango de caracteres
#"N-ZA-Mn-za-m" especifica el mapeo de los caracteres, que es el resultado de aplicar ROT13:
#     Las letras de la primera mitad del alfabeto (A-M y a-m) se sustituyen por las letras de la segunda mitad (N-Z y n-z).
#     Las letras de la segunda mitad (N-Z y n-z) se sustituyen por las letras de la primera mitad (A-M y a-m).