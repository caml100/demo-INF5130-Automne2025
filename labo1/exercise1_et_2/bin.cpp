#include <iostream>
#include <string>
#include <vector>

void afficherNombreBinaire(const std::vector<unsigned int> num) {
    for (unsigned int i = num.size(); i > 0; i--) {
        std::cout << num.at(i - 1);
    }
}

void remplirZero(std::vector<unsigned int>& num, unsigned int n) {
    unsigned int rest = n - num.size();
    for (unsigned int i = 0; i < rest; i++) {
        num.push_back(0);
    }
}

std::vector<unsigned int> creeNombreBin(const unsigned int num) {
    unsigned int rest = num;
    std::vector<unsigned int> resultat;
    if (num == 0)
        resultat.push_back(0);
    else {
        while (rest > 0) {
            resultat.push_back(rest % 2);
            rest >>= 1;
        }
    }

    return resultat;
}

std::vector<unsigned int> initZero(unsigned int n) {
    std::vector<unsigned int> tab(n);
    for (unsigned int i = 0; i < n; i++) {
        tab[i] = 0;
    }
    return tab;
}

std::vector<unsigned int> addBin(std::vector<unsigned int> A, std::vector<unsigned int> B) {
    std::vector<unsigned int> C = initZero(A.size() + 1);
    unsigned int retenue = 0;
    for (unsigned int i = 0; i < A.size(); i++) {
        C[i] = (A[i] + B[i] + retenue) % 2;
        retenue = (A[i] + B[i] + retenue) >> 1;
    }
    C[A.size()] = retenue;
    return C;
}

std::vector<unsigned int> multBin(std::vector<unsigned int> A, std::vector<unsigned int> B) {
    std::vector<unsigned int> resultat = initZero(A.size());
    unsigned int decalage = 0;
    for (unsigned int i = 0; i < B.size(); i++) {
        std::vector<unsigned int> temp = initZero(A.size() + decalage);
        for (unsigned int j = 0; j < A.size(); j++) {
            temp[j + decalage] = A[j] * B[decalage];
        }
        resultat = addBin(temp, resultat);
        decalage++;
    }
    return resultat;
}

int main(int argc, char** argv) {
    if (argc != 4) {
        std::cerr << "bin num num <add|mul>\n";
        return -1;
    }
    unsigned int num1 = atoi(argv[1]);
    unsigned int num2 = atoi(argv[2]);
    std::string op = argv[3];

    std::vector<unsigned int> A = creeNombreBin(num1);
    std::vector<unsigned int> B = creeNombreBin(num2);
    std::vector<unsigned int> C;

    if (A.size() > B.size())
        remplirZero(std::ref(B), A.size());
    else
        remplirZero(std::ref(A), B.size());

    if (op == "add")
        C = addBin(A, B);

    else if (op == "mul")
        C = multBin(A, B);
    else {
        std::cerr << "opération non reconnu\n";
        return -1;
    }

    std::cout << "(";
    afficherNombreBinaire(A);
    if (op == "add")
        std::cout << ")_2 + (";
    else
        std::cout << ")_2 * (";
    afficherNombreBinaire(B);
    std::cout << ")_2 = (";
    afficherNombreBinaire(C);
    std::cout << ")_2\n";

    return 0;
}
