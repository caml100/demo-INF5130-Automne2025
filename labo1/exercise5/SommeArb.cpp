#include <iostream>
#include <set>

bool trouverSomme(int* T, int x, int n) {
    std::set<int> ensemble;
    for (unsigned int i = 0; i < n; i++) {
        if (ensemble.find(T[i]) == ensemble.cend())
            ensemble.insert(x - T[i]);
        else
            return true;
    }
    return false;
}

int main(int argc, char** argv) {
    srand(time(0));
    int n;
    int x;
    std::cout << "Insert the length of the array : ";
    std::cin >> n;
    int tab[n];
    std::cout << "Array : [";
    for (unsigned int i = 0; i < n; i++) {
        tab[i] = rand() % 10;
        std::printf(" %d ", tab[i]);
    }
    std::cout << "]\n";
    std::cout << "Insert the summation to search in the array : ";
    std::cin >> x;
    bool etat = trouverSomme(tab, x, n);
    if (etat)
        std::printf("The array contains the summation of %d", x);
    else
        std::printf("The array does not contain the summation of %d", x);
    std::cout << x << std::endl;
    return 0;
}
