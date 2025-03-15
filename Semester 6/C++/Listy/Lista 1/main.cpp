#include <iostream>
#include <vector>
#include <string>
#include <cstdlib>
#include <cmath>
#include <stdexcept>

std::vector<int64_t> factorize(int64_t n) {
    std::vector<int64_t> prime_factors;

    if(n == 0 || n == 1 || n == -1) {
        return {n};
    }

    if(n < 0) {
        // in order not to exceed the range of long long,
        // we keep negative value of n instead of multiplying by -1
        prime_factors.push_back(-1);
    }

    while(n % 2 == 0) {
        prime_factors.push_back(2);
        n /= 2;
    }

    // in order not to exceed the range of long long,
    // we use sqrt() instead of i * i
    int64_t sqrt_value = std::abs(std::sqrt(n));

    for(int64_t i = 3; i <= sqrt_value; i += 2) {
        while(n % i == 0) {
            prime_factors.push_back(i);
            n /= i;
        }
    }

    if(n != 1 && n != -1) {
        prime_factors.push_back(std::abs(n));
    }

    return prime_factors;
}

int main(int argc, char* argv[]) {
    if(argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <integer> [<integer> ...]" << std::endl;
        return 1;
    }

    for(int i = 1; i < argc; i++) {
        try {
            int64_t num = std::stoll(argv[i]);
            std::vector<int64_t> prime_factors = factorize(num);

            std::cout << num << " = ";
            for(size_t j = 0; j < prime_factors.size(); j++) {
                if(j > 0) std::cout << " * ";
                std::cout << prime_factors[j];
            }
            std::cout << std::endl;

        }

        catch(const std::invalid_argument&) {
            std::cerr << "Invalid argument: " << argv[i] << " is not a valid integer." << std::endl;
            continue;
        }

        catch (const std::out_of_range&) {
            std::cerr << "Out of range error: " << argv[i] << " is too large for int64_t." << std::endl;
            continue;
        }
    }

    return 0;
}
