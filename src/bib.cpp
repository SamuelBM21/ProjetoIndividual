#include "../include/bib.hpp"
#include <limits>

unsigned long long factorial(unsigned int n) {
    unsigned long long result = 1ULL;
    for (unsigned int i = 2; i <= n; ++i) {
        if (result > std::numeric_limits<unsigned long long>::max() / i)
            return 0ULL; // overflow
        result *= i;
    }
    return result;
}