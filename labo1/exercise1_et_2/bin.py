def cree_nombre_bin(number):
    lst = []
    rest = number
    while rest > 0:
        lst.append(rest % 2)
        rest = rest >> 1
    if lst == []:
        lst.append(0)

    return lst

def remplir_zero(lst, supplement):
    rest = supplement - len(lst)
    for i in range (rest):
        lst.append(0)


def initialiser_list_vide(taille):
    lst = []
    for i in range(taille):
        lst.append(0)
    return lst

def add_bin(A,B):
    C = initialiser_list_vide(len(A) + 1)
    retenue = 0
    n = len(B)
    for i in range(n):
        C[i] = (A[i] + B[i] + retenue) % 2
        retenue = (A[i] + B[i] + retenue) >> 1
    C[n] = retenue
    return C

def mult_bin(A,B):
    C = initialiser_list_vide(len(A))
    decalage = 0
    n = len(B)
    for i in range(n):
        temp = initialiser_list_vide(n + decalage)
        for j in range(n):
            temp[j + decalage] = A[j] * B[decalage]
        C = add_bin(temp, C)
        decalage = decalage + 1
    return C


def afficher_nombre_binaire(lst):
    aff = lst
    aff.reverse()
    print(*aff,sep="",end=" ")


nombre1 = int(input("Entrer un premier nombre à additionner : "))
nombre2 = int(input("Entrer un deuxième nombre à additionner : "))
op = input("Opération à entrer entre + et * : ")

if op != "+" and op != "*":
    print("Opérateur inconnu")
else:


    lst_bin1 = cree_nombre_bin(nombre1)
    lst_bin2 = cree_nombre_bin(nombre2)
    if len(lst_bin1) > len(lst_bin2):
        remplir_zero(lst_bin2,len(lst_bin1))
    else:
        remplir_zero(lst_bin1,len(lst_bin2))

    afficher_nombre_binaire(lst_bin1)
    print(op,end=" ")
    afficher_nombre_binaire(lst_bin2)
    print("=",end=" ")
    lst_bin1.reverse()
    lst_bin2.reverse()

    if op == "+":
        resultat = add_bin(lst_bin1,lst_bin2)
    else:
        resultat = mult_bin(lst_bin1,lst_bin2)
    afficher_nombre_binaire(resultat)
    print()
