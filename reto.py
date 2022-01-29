matrizTiempo = [[8,0.4,1.5,0.6,0.1,1.3,1.1,0.5,1.3,0.6,0.5],
                [1.2,8,1.5,1.7,1.6,0.7,0.1,0.5,1.5,1,1.7],
                [0.5,0.4,8,0.1,1.1,1.5,1.1,1.1,1.4,0.7,1.1],
                [1.6,0.2,1.7,8,0.5,0.7,1.6,1.8,1.2,1,1.5],
                [1.3,0.9,1.6,1.1,8,0.4,1.8,1.3,1.7,0.3,0.1],
                [1.4,1.1,0.1,0.5,0.8,8,0.6,0.9,1.9,1,1.9],
                [1.4,1.7,0.4,0.4,0.7,1.7,8,0.6,0.6,1.5,0.3],
                [1.3,0.9,1.6,1.8,1.4,1.2,1.5,8,0.4,0.6,1.9],
                [1.5,0.8,2,0.8,0.3,0.3,1.9,1.6,8,1.4,2],
                [0.7,0.1,0.6,0.3,0.3,2,1.4,0.5,1.6,8,1.7],
                [1.2,1.9,0.8,0.2,0.8,1.7,0.7,2,1.6,1.7,8]]

clienteVolumen = [4,3,3,1,3,3,3,4,1,1]
volumenMax = 12
horasMax = 2

rutas = [] #lista de las listas de rutas (lista de las "lista")
lista = [] #para crear las listas de las rutas
clientesVisitados = [] #añadir el indice del cliente que hemos añadido (del contador)
tiempoRutas = []
contador = 0 #para saber que cliente hemos añadido
clientesF = [] #indices de todos los clientes que tenemos (cliente 0, cliente 1, cliente 2...)
tiemposFinales = []

for i in range(len(clienteVolumen)):
    clientesF.append(i)
print("Lista de clientes: ",clientesF)
print("Numero total de clientes: ", len(clientesF))
clientesNoVisitados = []
contador2 = 0

for contador in clientesF: 
    print("CONTADOR: ", contador)
    #Mientras que algun cliente no se encuentre en la lista
    #de clientes visitados, debemos hacer lo siguiente
    print("Horas actual: ", horasMax)
    print("IF: ",horasMax,"-",matrizTiempo[contador][contador+1])
    if (((horasMax-matrizTiempo[contador][contador+1])>0)): #if podemos agregar vol del cliente con indice contador
        lista.append(contador) #añade a una lista el num de cliente 
        print("Lista Actual = ", lista)
        horasMax = horasMax-matrizTiempo[contador][contador+1]
        print("Horas actual: ",horasMax)
        clientesVisitados.append(contador)
        tiempoRutas.append(matrizTiempo[contador][contador+1])
        print("Clientes visitados: ", clientesVisitados)
        print("--------------------------")
    else:
        tiemposFinales.append(tiempoRutas)
        tiempoRutas = []
        tiempoRutas.append(matrizTiempo[0][contador+1])
        lista.append(contador)
        print("El cliente ", contador, " no cumple con la restriccion")
        rutas.append(lista)
        print("RUTAS ACTUALES: ", rutas)
        lista = []
        lista.append(0)
        horasMax = 2 - matrizTiempo[0][contador+1]
        print("--------------------------")


    if contador == len(clientesF)-1:
            tiemposFinales.append([matrizTiempo[0][contador+1]])
            rutas.append(lista)
rutas.pop(-1)
print(rutas)
print(tiemposFinales)
