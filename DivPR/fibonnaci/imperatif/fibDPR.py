def multiplier(a, b):
    temp = [[0, 0],[0, 0]]
    temp[0][0] = a[0][0] * b[0][0] + a[0][1] * b[1][0]
    temp[0][1] = a[0][0] * b[0][1] + a[0][1] * b[1][1]
    temp[1][0] = a[1][0] * b[0][0] + a[1][1] * b[1][0]
    temp[1][1] = a[1][0] * b[0][1] + a[1][1] * b[1][1]
    return temp

# On redéfinit l'exponentiation à la russe pour pouvoir
# multiplier des matrices.
def exponentiation(a, x):
    if x <= 1:
        return a
    if x % 2 == 0:
        return exponentiation(multiplier(a, a), x >> 1)
    temp = exponentiation(multiplier(a,a), x >> 1)
    return multiplier(a, temp)


# Calcul de la suite de suite de Fibonnacci avec la méthode
# "diviser pour régner"
# Complexité temporelle : O(log n)
# Complexité spatiale sur la pile : O(log n)
def fib(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    base = [[1,1], [1,0]]
    result = exponentiation(base, n - 1)
    return result[0][0]




n = int(input("Veuiller entrer un nombre : "))
result = fib(n)
print(f"F_{n} = {result}")
