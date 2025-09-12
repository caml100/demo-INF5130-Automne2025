import random

def est_sans_doublon(T):
    n = len(T)
    T.sort()
    for i in range (n - 1):
        if T[i] == T[i + 1]:
            return False
    return True


tab = []
n = int(input("Veuillez entrer la taille du tableau souhaitée : "))
for i in range(n):
    tab.append(random.randint(0,100))

print(tab)

contient_des_doublons = est_sans_doublon(tab)
if contient_des_doublons:
    print("Tableau sans doublon")
else:
    print("Tableau avec doublon")
