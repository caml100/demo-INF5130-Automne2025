import sys

# Executer l'exponentiation de manière naive
# Complexité temporel : O(x) 
# Complexité spatial sur la pile : O(1)
def exponentiation_naive(n, x):
    result = 1
    for i in range(x):
        result *= n
    return result

# Exercute l'exponentiation se basant sur le principe
# "diviser pour régner"
# Complexité temporel : O(log x) 
# Complexité spatial sur la pile : O(log x)
def exponentiation_rapide(n, x):
    if x == 0:
        return 1
    if x % 2 == 0:
        return exponentiation_rapide(n * n, x >> 1)
    return n * exponentiation_rapide(n * n, x >> 1)


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
