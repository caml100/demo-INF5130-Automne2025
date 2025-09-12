import random

def trouver_somme(T,x):
    i = 0
    j = len(tab) - 1
    tab.sort()
    while i < j:
        if T[i] + T[j] < x:
            i += 1
        elif T[i] + T[j] > x:
            j -= 1
        else:
            return True
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
