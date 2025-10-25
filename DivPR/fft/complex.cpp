#include "complex.hpp"
#include <cmath>

complex_number::complex_number(double r, double im) : real(r), imag(im) {}

complex_number::~complex_number() {}

double complex_number::get_real_part() const { return real; }

double complex_number::get_imag_part() const { return imag; }

complex_number complex_number::add(const complex_number& c) const {
    double r2 = c.get_real_part();
    double i2 = c.get_imag_part();
    double r = real + r2;
    double im = imag + i2;
    return complex_number(r, im);
}

complex_number complex_number::sub(const complex_number& c) const {
    double r2 = c.get_real_part();
    double i2 = c.get_imag_part();
    double r = real - r2;
    double im = imag - i2;
    return complex_number(r, im);
}

complex_number complex_number::mult(const complex_number& com) const {
    double a = real;
    double b = imag;
    double c = com.get_real_part();
    double d = com.get_imag_part();
    double real_part = (a * c) - (b * d);
    double imag_part = (a * d) + (b * c);
    // ac + adi + bci + bd(-1)
    return complex_number(real_part, imag_part);
}

complex_number exponentiation(const double nombre) { return complex_number(cos(nombre), sin(nombre)); }

std::ostream& operator<<(std::ostream& os, const complex_number& c) {
    os << c.real;
    if (c.imag < 0)
        os << " - " << (c.imag * -1) << "i";
    else if (c.imag > 0)
        os << " + " << c.imag << "i";
    return os;
}

complex_number complex_number ::operator+(const complex_number& c) const { return this->add(c); }

complex_number complex_number ::operator-(const complex_number& c) const { return this->sub(c); }

complex_number complex_number ::operator*(const complex_number& com) const {
    // ac + adi + bci + bd(-1)
    return this->mult(com);
}
