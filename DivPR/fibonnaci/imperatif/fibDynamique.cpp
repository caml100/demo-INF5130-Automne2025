#include <iostream>

using namespace std;

/*
 * Programmation dynamique O(n)
 */
unsigned long fibDynamic(unsigned int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    unsigned long fib_1 = 0;
    unsigned long fib_2 = 1;
    unsigned long result;
    for (unsigned int i = 1; i < n; i++) {
        result = fib_1 + fib_2;
        fib_1 = fib_2;
        fib_2 = result;
    }
    return result;
}

int main(int argc, char** argv) {
    if (argc != 2) {
        cerr << "./fibDynamique nombre\n";
        return 1;
    }
    unsigned int n = atoi(argv[1]);
    unsigned long result = fibDynamic(n);
    cout << result << endl;
    return 0;
}
