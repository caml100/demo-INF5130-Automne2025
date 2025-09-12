#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <iostream>

bool estSansDoublon(int* T, int n) {
    std::sort(T, T + n);
    for (int i = 0; i < n; i++) {
        if (i < (n - 1) && T[i] == T[i + 1])
            return false;
    }
    return true;
}

int main(int argc, char** argv) {
    srand(time(0));
    int n;
    std::cout << "Insert the length of the array : ";
    std::cin >> n;
    int Tab[n];
    std::cout << "The following array \n[";
    for (unsigned int i = 0; i < n; i++) {
        Tab[i] = rand() % 50;
        std::printf(" %d ", Tab[i]);
    }
    std::cout << "]\n";
    bool etat = estSansDoublon(Tab, n);
    if (etat)
        std::cout << "does not have duplicates\n";
    else
        std::cout << "has duplicates\n";
    return 0;
}
