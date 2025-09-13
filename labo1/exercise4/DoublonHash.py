import random

def est_sans_doublon(T):
    ensemble = set()
    n = len(T)
    for i in range (n):
        if T[i] in ensemble:
            return False
        else:
            ensemble.add(T[i])
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
