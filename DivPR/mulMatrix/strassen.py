import random

# Permet de récupérer une partie de la matrice a
# selon la portion en x et portion en y demandé.
def get_chunk(a, portionx, portiony, length):
    c = [[0] * length] * length
    for i in range(length):
        for j in range(length):
            c[i][j] = a[i + portionx][j + portiony]
    return c

def add(a,b):
    c = []
    n = len(a)
    m = len(a[0])
    for i in range(n):
        c.append([0] * m)
    for i in range(n):
        for j in range(m):
            c[i][j] = a[i][j] + b[i][j]
    return c

def sub(a,b):
    c = []
    n = len(a)
    m = len(a[0])
    for i in range(n):
        c.append([0] * m)
    for i in range(n):
        for j in range(m):
            c[i][j] = a[i][j] - b[i][j]
    return c


# N'est appelé que dans le cas où on fait une multiplication sur une matrice 2 x 2
def multiplication(a, b):
    c = []
    n = len(a)
    m = len(a[0])
    for i in range(n):
        c.append([0] * m)

    for i in range(n):
        for j in range(m):
            acc = 0
            for k in range(n):
                acc += (a[i][k] * b[k][j])
            c[i][j] = acc
    return c


# Multiplication matricielle en utilisant l'algorithme de Strassen
def strassen(a, b):
    n = len(a)
    if n <= 2:
        return multiplication(a, b)
    else:
        rest = n >> 1
        m1 = strassen(add (get_chunk(a, 0, 0, rest), get_chunk(a, rest, rest, rest)) ,add (get_chunk(b, 0, 0, rest), get_chunk(b, rest, rest, rest)))
        m2 = strassen(add (get_chunk(a, rest, 0, rest), get_chunk(a, rest, rest, rest)) , get_chunk(b, 0, 0, rest) )
        m3 = strassen(get_chunk (a, 0, 0, rest) , sub (get_chunk(b, 0, rest, rest), get_chunk(b, rest, rest, rest)))
        m4 = strassen(get_chunk (a, rest, rest, rest), sub (get_chunk(b, rest, 0, rest), get_chunk(b, 0, 0, rest)))
        m5 = strassen(add (get_chunk(a, 0, 0, rest), get_chunk(a, 0, rest, rest)) , get_chunk(b, rest, rest, rest) )
        m6 = strassen(sub (get_chunk(a, rest, 0, rest), get_chunk(a, 0, 0, rest)) ,add (get_chunk(b, 0, 0, rest), get_chunk(b, 0, rest, rest)))
        m7 = strassen(sub (get_chunk(a, 0, rest, rest), get_chunk(a, rest, rest, rest)) ,add (get_chunk(b, rest, 0, rest), get_chunk(b, rest, rest, rest)))

        c1 = add (sub ( add(m1, m4), m5), m7)
        c2 = add (m3, m5)
        c3 = add (m2, m4)
        c4 = add (add (sub(m1, m2), m3), m6)
        
        result = [[0] * n] * n
        for i in range(n):
            for j in range(n):
                if i < rest and j < rest:
                    result[i][j] = c1[i][j]
                elif i < rest and j >= rest:
                    result[i][j] = c2[i][j - rest]
                elif i >= rest and j < rest:
                    result[i][j] = c3[i - rest][j]
                else:
                    result[i][j] = c4[i - rest][j - rest]

        return result 



taille1 = int(input("Taille des deux matrices : "))
a = [[0] * taille1] * taille1
b = [[0] * taille1] * taille1
for i in range(taille1):
    for j in range(taille1):
        a[i][j] = random.randint(-100, 100)
        b[i][j] = random.randint(-100, 100)
print(strassen(a, b))
