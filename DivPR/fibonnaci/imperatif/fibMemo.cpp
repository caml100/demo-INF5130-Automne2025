#include <iostream>
#include <unordered_map>

using namespace std;
unordered_map<unsigned int, unsigned long> cache;

/*
 * Calcule de la suite de fibonnacci avec mémoisation O(n)
 *
 */
unsigned long fibMemo(unsigned int n) {
    auto element = cache.find(n);
    if (element != cache.cend())
        return cache[n];
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    unsigned long result = fibMemo(n - 1) + fibMemo(n - 2);
    cache[n] = result;
    return result;
}

int main(int argc, char** argv) {
    if (argc != 2) {
        cerr << "./fibMemo nombre\n";
        return 1;
    }
    unsigned int n = atoi(argv[1]);
    unsigned long resultat = fibMemo(n);
    cout << resultat << endl;
    return 0;
}
