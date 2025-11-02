#include <algorithm>
#include <iostream>
#include <string>

int obtenirMinimum(int choix1, int choix2, int choix3) {
    int minimum = std::min({choix1, choix2, choix3});
    return minimum;
}

int calculerSub(const char c1, const char c2, int sub) { return c1 == c2 ? 0 : sub; }

void Levenshtein(std::string x, std::string y, int del, int ins, int sub) {
    unsigned int m = x.length();
    unsigned int n = y.length();
    int tab[m + 1][n + 1];
    std::string dir[m][n];
    tab[0][0] = 0;
    for (unsigned int i = 1; i <= m; i++) {
        tab[i][0] = tab[i - 1][0] + del;
    }

    for (unsigned int j = 1; j <= n; j++) {
        tab[0][j] = tab[0][j - 1] + ins;
        for (unsigned int i = 1; i <= m; i++) {
            unsigned int indexi = 0 + (i - 1);
            unsigned int indexj = 0 + (j - 1);
            int coutSwap = calculerSub(x[indexi], y[indexj], sub);
            int cas1 = tab[i - 1][j - 1] + coutSwap;
            int cas2 = tab[i - 1][j] + del;
            int cas3 = tab[i][j - 1] + ins;
            tab[i][j] = obtenirMinimum(cas1, cas2, cas3);
            if (cas1 == cas2 && cas1 == cas3)
                dir[indexi][indexj] = 0 == coutSwap ? "T,D,I" : "S,D,I";
            else if (tab[i][j] == cas1 && cas1 == cas2)
                dir[indexi][indexj] = 0 == coutSwap ? "T,D" : "S,D";
            else if (tab[i][j] == cas1 && cas1 == cas3)
                dir[indexi][indexj] = 0 == coutSwap ? "T,I" : "S,I";
            else if (tab[i][j] == cas2 && cas2 == cas3)
                dir[indexi][indexj] = "D,I";
            else if (tab[i][j] == cas1)
                dir[indexi][indexj] = 0 == coutSwap ? "T" : "S";
            else if (tab[i][j] == cas2)
                dir[indexi][indexj] = "D";
            else
                dir[indexi][indexj] = "I";
        }
    }

    std::cout << "Matrice des distances : \n";
    for (unsigned int i = 0; i <= m; i++) {
        for (unsigned int j = 0; j <= n; j++) {
            std::cout << tab[i][j] << "\t";
        }
        std::cout << "\n";
    }
    std::cout << "\nMatrice des directions : \n";
    for (unsigned int i = 0; i < m; i++) {
        for (unsigned int j = 0; j < n; j++) {
            std::cout << dir[i][j] << "\t";
        }
        std::cout << "\n";
    }
}

int main(int argc, char** argv) {
    if (argc != 6) {
        std::cerr << "./Levenshtein seq1 seq1 cout_del cout_insert cout_swap\n";
        return 1;
    }
    Levenshtein(argv[1], argv[2], atoi(argv[3]), atoi(argv[4]), atoi(argv[5]));
    return 0;
}
