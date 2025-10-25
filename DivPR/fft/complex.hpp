#ifndef __COMPLEX_HPP__
#define __COMPLEX_HPP__

#include <iostream>

class complex_number {
  private:
    double real;
    double imag;

  public:
    complex_number(double r = 0, double im = 0);
    ~complex_number();
    double get_real_part() const;
    double get_imag_part() const;
    complex_number add(const complex_number&) const;
    complex_number sub(const complex_number&) const;
    complex_number mult(const complex_number&) const;
    complex_number pow(const complex_number&) const;
    complex_number operator+(const complex_number&) const;
    complex_number operator-(const complex_number&) const;
    complex_number operator*(const complex_number&) const;
    friend std::ostream& operator<<(std::ostream&, const complex_number&);
};

complex_number exponentiation(const double);

#endif
