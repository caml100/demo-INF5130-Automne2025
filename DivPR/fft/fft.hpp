#ifndef __FFT_HPP__
#define __FFT_HPP__

#include "complex.hpp"
#include <vector>

std::vector<complex_number> dft(std::vector<complex_number> a);

std::vector<complex_number> fft(std::vector<complex_number> a);

#endif
