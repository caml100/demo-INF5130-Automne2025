# On utilise la programmation dynamique pour éviter
# de faire des appels récursifs comme avec le cache
# et le faire de manière itérative.
# Complexité temporelle : O(n)
# Complexité spatiale : O(1)
# Note : Il est pas nécessaire de comprendre la
# programmation dynamique pour le moment pour comprendre
# l'algorithme
def fib(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    fib_1 = 0
    fib_2 = 1
    result = 0
    i = 1
    while i < n:
        result = fib_1 + fib_2
        fib_1 = fib_2
        fib_2 = result
        i += 1
    return result

n = int(input("Veuillez entrer un nombre : "))
result = fib(n)
print(f"F_{n} = {result}")
