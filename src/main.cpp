#include <cassert>
#include <iostream>
#include "bib.hpp"

int main() {
    assert(factorial(0) == 1ULL);
    assert(factorial(1) == 1ULL);
    assert(factorial(5) == 120ULL);
    assert(factorial(10) == 3628800ULL);

    // Testar overflow (21! não cabe em 64 bits)
    unsigned long long v = factorial(21);
    if (v != 0ULL) {
        std::cerr << "Erro: esperava overflow em 21! mas obteve " << v << std::endl;
        return 1;
    }

    std::cout << "Todos os testes passaram!" << std::endl;
    return 0;
}