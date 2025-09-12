import random

def trouver_somme (T,x):
    ensemble = set()
    n = len(T)
    for i in range (n):
        if T[i] in ensemble:
            return True
        else:
            ensemble.add(x - T[i])
    return False


tab = []
n = int(input("Veuillez entrer la taille du tableau souhaitée : "))
for i in range(n):
    tab.append(random.randint(0,100))
print("Tableau généré : \n" + str(tab))
x = int(input("Veuillez entrer la somme à chercher : "))

somme_trouve = trouver_somme(tab,x)
if somme_trouve:
    print("Somme trouvée")
else:
    print("Somme non trouvée")
