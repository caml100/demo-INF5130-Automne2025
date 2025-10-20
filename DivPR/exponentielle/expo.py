import sys

# Executer l'exponentiation de manière naive
# Complexité temporel : O(n) 
# Complexité spatial sur la pile : O(1)
def exponentiation_naive(x, n):
    result = 1
    for i in range(n):
        result *= x
    return result

# Exercute l'exponentiation se basant sur le principe
# "diviser pour régner"
# Complexité temporel : O(log n) 
# Complexité spatial sur la pile : O(log n)
def exponentiation_rapide(x, n):
    if n == 0:
        return 1
    if n % 2 == 0:
        return exponentiation_rapide(x * x, n >> 1)
    return x * exponentiation_rapide(x * x, n >> 1)


if len(sys.argv) != 4:
    print("expo nombre puissance [naive|rapide]")
else:
    nombre = int(sys.argv[1])
    puissance = int(sys.argv[2])
    methode = sys.argv[3]
    resultat = 1
    if methode == 'naive':
        resultat = exponentiation_naive(nombre, puissance)
    else:
        resultat = exponentiation_rapide(nombre, puissance)
    print(f"{nombre} ^ {puissance} = {resultat}")
