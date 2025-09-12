#include <algorithm>
#include <cstdlib>
#include <ctime>
#include <iostream>
#include <unordered_map>

bool estSansDoublon(int* T, int n) {
    std::unordered_map<int, int> set;
    auto iterator = set.cend();
    for (int i = 0; i < n; i++) {
        iterator = set.find(T[i]);
        if (iterator != set.cend())
            return false;
        else
            set[T[i]] = i;
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
