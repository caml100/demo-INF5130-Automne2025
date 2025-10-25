import random


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


taille1 = int(input("Taille des deux matrices : "))
a = [[0] * taille1] * taille1
b = [[0] * taille1] * taille1
for i in range(taille1):
    for j in range(taille1):
        a[i][j] = random.randint(-100, 100)
        b[i][j] = random.randint(-100, 100)

print(multiplication(a, b))
