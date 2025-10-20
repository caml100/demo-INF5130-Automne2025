#include <iostream>
#include <vector>

using namespace std;

/*
 *
 *
 * L'approche «diviser pour régner» est la meilleure pour calculer les nombre de Fibonnacci
 * avec l'utilisation des matrices qui se fait en O(log(n))
 */

/*
 * Démo de multiplication matricielle (Faire sur un bout de papier pour comprendre :) )
 *
 *
 *         3 2
 *         3 3
 *
 *   4  2       = 4 * 3 + 2 * 3 | 4 * 2 + 2 * 3 =  18 | 14
 *   3  3       = 3 * 3 + 3 * 3 | 3 * 2 + 3 * 3 =  18 | 15
 *
 *
 *
 *
 *
 */

vector<vector<unsigned long>> multiplication(vector<vector<unsigned long>> A, vector<vector<unsigned long>> B) {
    vector<vector<unsigned long>> temp(2);
    for (unsigned int i = 0; i < 2; i++) {
        temp[i] = vector<unsigned long>(2);
    }

    temp[0][0] = A[0][0] * B[0][0] + A[0][1] * B[1][0];
    temp[0][1] = A[0][0] * B[0][1] + A[0][1] * B[1][1];
    temp[1][0] = A[1][0] * B[0][0] + A[1][1] * B[1][0];
    temp[1][1] = A[1][0] * B[0][1] + A[1][1] * B[1][1];

    return temp;
}

vector<vector<unsigned long>> exponentiation(vector<vector<unsigned long>> A, unsigned int n) {
    if (n <= 1)
        return A;
    if (n % 2 == 0)
        return exponentiation(multiplication(A, A), n >> 1);
    vector<vector<unsigned long>> temp = exponentiation(multiplication(A, A), n >> 1);
    return multiplication(A, temp);
}

/*
 * On s'inpire de l'exponentiation rapide pour faire le calcule
 * matricielle
 *
 *
unsigned long exponentiation(unsigned int x,unsigned int n){
        if (n == 0)
                return 1;
        if (n % 2 == 0)
                return exponentiation(x * x, n / 2);
        return x * exponentiation(x * x,n / 2);
}
*/

unsigned long fib(unsigned int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;

    vector<vector<unsigned long>> base = {{1, 1}, {1, 0}};
    vector<vector<unsigned long>> result = exponentiation(base, n - 1);
    return result[0][0];
}

int main(int argc, char** argv) {
    if (argc != 2) {
        cerr << "./fibDPR nombre\n";
        return 1;
    }
    unsigned int n = atoi(argv[1]);
    unsigned long result = fib(n);
    cout << result << endl;
    return 0;
}
