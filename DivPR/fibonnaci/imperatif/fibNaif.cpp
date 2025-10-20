#include <iostream>

using namespace std;

/*
 * Version naive et inefficace de calculer la suite de Fibonnacci O(2^n)!!
 * En réalité c'est plus O(ф^n) où ф est le nombre d'or et est égale à (1 + 5^{1/2}) / 2
 */
unsigned long fibNaif(unsigned int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    return fibNaif(n - 1) + fibNaif(n - 2);
}

int main(int argc, char** argv) {
    if (argc != 2) {
        cerr << "./fibNaif nombre\n";
        return 1;
    }
    unsigned int n = atoi(argv[1]);
    unsigned long resultat = fibNaif(n);
    cout << resultat << endl;
    return 0;
}
