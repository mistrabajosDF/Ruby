=begin
Dado un color en RGB, se obtenenga su representación entera y hexadecimal. La notación entera
se define como red + green * 256 + blue * 256 * 256 y la hexadecimal como el resultado de expresar
en base 16 el valor de cada color y concatenarlos en orden.
=end


def notacion_hexadecimal (arr)
	print "#"+arr.map {|i| format("%02x", i)}.join.upcase
end

def notacion_entera (arr)
	print (arr.map.with_index {|elem, i| elem * 256 **i}.sum)
	#La i es al pos en el arreglo
end

def notacion_entera_v3 (arr)
	print(arr.each.with_index.inject (0){|acc, (elem, i)| acc +=elem*256**i})
end

def notacion_entera_v2 (arr)
	print(arr.each.with_index.inject (0){|acc, arr| acc +=arr[0]*256**(arr[1])})
end

notacion_hexadecimal ([0, 128, 255])
puts("\n-----")
notacion_entera ([0, 128, 255])
puts("\n-----")
notacion_entera_v3 ([0, 128, 255])
puts("\n-----")
notacion_entera_v2 ([0, 128, 255])

