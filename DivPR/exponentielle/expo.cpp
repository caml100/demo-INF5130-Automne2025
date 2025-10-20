#include <iostream>
#include <string>

/* Fait l'exponentiation de manière naive.
 * Complexité temporelle : O(x)
 * Complexité spatiale sur la pile : O(1)
 *
 */
unsigned long expo_naif (unsigned int n, unsigned int x) {
    unsigned long resultat = 1;
    for (unsigned int i = 0; i < x; i++) {
        resultat *= n;
    }
    return resultat;
}


/* Fait l'exponentiation rapide se basant sur le
 * principe diviser pour régner.
 * Complexité temporelle : O(log x)
 * Complexité spatiale sur la pile : O(log x)
 */
unsigned long expo_rapide (unsigned int n, unsigned int x) {
    if (x == 0)
        return 1;
    if (x % 2 == 0)
        return expo_rapide(n * n, x >> 1);
    return n * expo_rapide(n * n, x >> 1);
}



int main(int argc, char** argv) {
    if (argc != 4) {
        std::cerr << "./expo nombre puissance [naif | rapide]\n";
        return 1;
    }
    unsigned int n = atoi(argv[1]), x = atoi(argv[2]);
    std::string methode = argv[3];
    unsigned long resultat = 1;
    if (methode == "naif") {
        resultat = expo_naif(n, x);
    } else
        resultat = expo_rapide(n, x);

    std::printf("%u^%u = %u\n", n, x, resultat);
    return 0;
}
