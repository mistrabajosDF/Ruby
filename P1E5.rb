=begin
Función reemplazar: dado un String, busca y reemplace en éste cualquier ocurrencia de "{" por "do\n"
y cualquier ocurrencia de "}" por "\nend", de modo que convierta los bloques escritos con llaves por bloques multilínea
con do y end. Por ejemplo:
reemplazar("3.times { |i| puts i }")
# => "3.times do\n |i| puts i \nend"
=end

def reemplazar (texto)
	texto.gsub('{', 'do\n').gsub('}', '\nend')
end

text="inicio { medio } fin"

puts "Texto original: #{text}"
puts "Texto reemplazado: #{reemplazar (text)}"
