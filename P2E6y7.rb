=begin
Los usuarios de una aplicación tienen un rol que determina qué operaciones
pueden hacer: Lector, Redactor, Director y Administrador. 
• Los Lectores pueden ver cualquier Documento público.
• Los Redactores pueden hacer todo lo que los Lectores y además pueden cambiar el 
contenido de los Documentos que ellos crearon.
• Los Directores pueden ver y cambiar el contenido de cualquier documento (público o 
privado, y creado por cualquier usuario), excepto aquellos que hayan sido borrados.
• Los Administradores pueden hacer lo mismo que los directores y además pueden borrar
Documentos.

los usuarios implementan #to_s que debe retornar el atributo usuario y
el rol que posee.
=end

class Documento
  attr_accessor :creador, :contenido, :publico, :borrado #Esto crea get y set de esos atributos
  
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
    usuario.puede_ver?(self)
  end

  def puede_ser_modificado_por?(usuario)
    usuario.puede_modificar?(self)
  end

  def puede_ser_borrado_por?(usuario)
    usuario.puede_borrar?(self)
  end
end

#Hasta acá dado por la cátedra

class Usuario
  attr_accessor :usuario, :clave, :email
  
  def initialize(usuario, clave, email)
    @usuario = usuario
    @clave = clave
    @email = email
  end
  
  def puede_ver?(documento)
    false
  end

  def puede_modificar?(documento)
    false
  end

  def puede_borrar?(documento)
    false
  end

  #PUNTO 7
  def to_s
    "#{email} (#{self.class.name})"
  end

end

class Lector < Usuario
  #Los Lectores pueden ver cualquier Documento que esté marcado como público.
  def puede_ver?(documento)
    documento.publico && !documento.borrado
  end
end

class Redactor < Lector
  #Los Redactores pueden hacer todo lo que los Lectores y además pueden cambiar el contenido de los Documentos que ellos crearon.
  def puede_modificar?(documento)
    documento.creador == self && !documento.borrado
  end
end

class Director < Usuario
  #Los Directores pueden ver y cambiar el contenido de cualquier documento (público o privado, y creado por cualquier usuario), excepto que hayan sido borrados.
  def puede_ver?(documento)
    !documento.borrado
  end

  def puede_modificar?(documento)
    !documento.borrado
  end
end

class Administrador < Director
  #Los Administradores pueden hacer lo mismo que los directores y además pueden borrar Documentos.
  def puede_borrar?(documento)
    !documento.borrado
  end
end

# Ejemplo de uso
usuario1 = Lector.new('lector1', 'clave1', 'lector1@gmail.com')
usuario2 = Redactor.new('redactor1', 'clave2', 'redactor1@gmail.com')
usuario3 = Director.new('director1', 'clave3', 'director1@gmail.com')
usuario4 = Administrador.new('admin1', 'clave4', 'admin1@gmail.com')

doc_publ = Documento.new(usuario2, true, 'Contenido público')
doc_priv = Documento.new(usuario3, false, 'Contenido privado')

puts "El redactor puede ver el documento 1? " + usuario1.puede_ver?(doc_publ).to_s
puts "El redactor puede ver el documento 2? " + usuario1.puede_ver?(doc_priv).to_s
puts "El redactor puede modificar el documento (El lo creo)? " + usuario2.puede_modificar?(doc_publ).to_s
puts "El redactor puede modificar el documento 2 (El no lo creo)? " + usuario2.puede_modificar?(doc_priv).to_s
puts "El director puede modificar el documento 2? " + usuario3.puede_modificar?(doc_priv).to_s
puts "El administrador borrar ver el documento 2? " + usuario4.puede_borrar?(doc_priv).to_s

#PUNTO 7
lector = Lector.new('lector1', 'clave1', 'elhector@example.org')
administrador = Administrador.new('admin1', 'clave4', 'admin@example.org')

puts usuario1.to_s
puts usuario4.to_s
