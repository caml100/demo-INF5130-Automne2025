#include "fft.hpp"
#include <cmath>

double PI = acos(-1.0);

std::vector<complex_number> fft(std::vector<complex_number> a) {
    int n = a.size();
    if (n == 1)
        return a;
    unsigned int half = n >> 1;
    complex_number w_n = exponentiation((-2) * PI / n);
    complex_number w = complex_number(1.0, 0.0);
    std::vector<complex_number> pairs;
    std::vector<complex_number> impairs;
    for (unsigned int i = 0; i < n; i++) {
        if (i % 2 == 0)
            pairs.push_back(a[i]);
        else
            impairs.push_back(a[i]);
    }
    std::vector<complex_number> y_pair = fft(pairs);
    std::vector<complex_number> y_impair = fft(impairs);
    std::vector<complex_number> y(n);
    for (unsigned int j = 0; j < half; j++) {
        y[j] = y_pair[j] + (w * y_impair[j]);
        y[j + half] = y_pair[j] - (w * y_impair[j]);
        w = w * w_n;
    }
    return y;
}

std::vector<complex_number> dft(std::vector<complex_number> a) {
    std::vector<complex_number> result(a.size());
    for (unsigned int i = 0; i < a.size(); i++) {
        complex_number acc = complex_number();
        for (unsigned int j = 0; j < a.size(); j++) {
            acc = acc + a[j] * exponentiation((-2) * PI * i * j / a.size());
        }
        result[i] = acc;
    }
    return result;
}
