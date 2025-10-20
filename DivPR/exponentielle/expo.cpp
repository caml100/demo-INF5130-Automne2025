#include <iostream>
#include <string>

/* Fait l'exponentiation de manière naive.
 * Complexité temporelle : O(n)
 * Complexité spatiale sur la pile : O(1)
 *
 */
unsigned long expo_naif (unsigned int x, unsigned int n) {
    unsigned long resultat = 1;
    for (unsigned int i = 0; i < n; i++) {
        resultat *= x;
    }
    return resultat;
}


/* Fait l'exponentiation rapide se basant sur le
 * principe diviser pour régner.
 * Complexité temporelle : O(log n)
 * Complexité spatiale sur la pile : O(log n)
 */
unsigned long expo_rapide (unsigned int x, unsigned int n) {
    if (n == 0)
        return 1;
    if (n % 2 == 0)
        return expo_rapide(x * x, n >> 1);
    return x * expo_rapide(x * x, n >> 1);
}



int main(int argc, char** argv) {
    if (argc != 4) {
        std::cerr << "./expo nombre puissance [naif | rapide]\n";
        return 1;
    }
    unsigned int x = atoi(argv[1]), n = atoi(argv[2]);
    std::string methode = argv[3];
    unsigned long resultat = 1;
    if (methode == "naif") {
        resultat = expo_naif(x, n);
    } else
        resultat = expo_rapide(x, n);

    std::printf("%u^%u = %u\n", x, n, resultat);
    return 0;
}
