#include "complex.hpp"
#include "fft.hpp"
#include <random>
#include <string>
#include <vector>

int main(int argc, char** argv) {
    if (argc != 3) {
        std::cerr << "./Fourrier nombre [dft|fft]\n";
        return 1;
    }
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_real_distribution<> dis(-100341.0, 101003.999332);
    std::vector<complex_number> ve;
    unsigned int size = atoi(argv[1]);
    std::string method = argv[2];
    for (unsigned int i = 0; i < size; i++)
        ve.push_back(complex_number(dis(gen), dis(gen)));
    std::vector<complex_number> result;
    if (method == "dft")
        result = dft(ve);
    else
        result = fft(ve);

    for (int i = 0; i < result.size(); i++) {
        std::cout << result[i] << "\n";
    }
    return 0;
}
