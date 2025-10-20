# Calcul de la suite de fibonnacci, mais
# avec un cache pour éviter de faire
# les mêmes calculs en double.
# Complexité temporelle : O(n)
# Complexité spatiale : O(n)
def fib(n, cache):
    if n in cache:
        return cache[n]
    if (n == 0):
        return 0
    if (n == 1):
        return 1
    result = fib(n - 1, cache) + fib(n - 2, cache)
    cache[n] = result
    return result

n = int(input("Veuillez entrer un nombre : "))
result = fib(n, {})
print(f"F_{n} = {result}")


