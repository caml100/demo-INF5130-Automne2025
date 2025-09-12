def est_sans_doublon(T):
    ensemble = set()
    n = len(T)
    for i in range (n):
        if T[i] in ensemble:
            return False
        else:
            ensemble.add(T[i])
    return True

lst = [3,4,7,1,9,2]
print(est_sans_doublon(lst))
