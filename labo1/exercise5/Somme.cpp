#include <algorithm>
#include <iostream>

bool trouverSomme(int* T, int x, int n) {
    int i = 0;
    int j = n - 1;
    std::sort(T, T + n);
    while (i < j) {
        if (T[i] + T[j] < x)
            i++;
        else if (T[i] + T[j] > x)
            j--;
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
    std::cout << "Insert the summation to search in the array : ";
    std::cin >> x;
    std::cout << "The following array : [";
    for (unsigned int i = 0; i < n; i++) {
        tab[i] = rand() % 10;
        std::printf(" %d ", tab[i]);
    }
    std::cout << "]\n";
    bool etat = trouverSomme(tab, x, n);
    if (etat)
        std::cout << "contains the summation ";
    else
        std::cout << "does not contain the summation ";
    std::cout << x << std::endl;
    return 0;
}
