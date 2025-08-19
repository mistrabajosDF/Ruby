=begin
Analiza los siguientes métodos, que ubican el manejo
de excepciones en distintas partes.
=end

def opcion_1
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    c = a.map do |x| #Falla al querer multiplicar nil * 3
        x * b
    end
    puts c.inspect
rescue
    0
end

def opcion_2
    c = begin
            a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
            b = 3
            a.map do |x|
                x * b
            end
        rescue
            0 #no puede multiplicar nil * 3, pero el rescue esta dentro bloque asi que imprime eso 
        end
    puts c.inspect
end

    def opcion_3
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        c = a.map { |x| x * b } rescue 0 #idem 2, el rescue esta asociado a c, asi que imprime 0
        puts c.inspect
    end

    def opcion_4
        a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
        b = 3
        c = a.map { |x| x * b rescue 0 } #Aca para cada vez que itere y falle, se pone 0 y sigue iterando
        puts c.inspect
    end

    puts ("Ejecutando 1") #No imprime nada
    opcion_1()
    puts ("Ejecutando 2") #Imprime 0
    opcion_2()
    puts ("Ejecutando 3") #Imprime 0
    opcion_3()
    puts ("Ejecutando 4") #Imprime [3, 0, 9, 0, 15, 0, 21, 0, 27, 0]
    opcion_4()
