
# Fib naive. 
# Complexité temporelle : exponentielle
def fib(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    return fib(n - 1) + fib(n - 2)


n = int(input("Veuiller entre un nombre : "))
result = fib(n)
print(f"Fib_{n} = {result}")
