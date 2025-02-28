// Jan Burdzicki
// List: 1
// Task: 1, 2

#include <stdio.h>
#include <stdlib.h>

// Imperative factorial function
unsigned long long factorial_iterative(int n) {
    unsigned long long result = 1;
    for(int i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Recursive factorial function
unsigned long long factorial_recursive(int n) {
    if(n == 0) return 1;
    return n * factorial_recursive(n - 1);
}

// Binomial coefficient calculation using factorial
unsigned long long binomial(int n, int k) {
    // binomial(n, k) = (n choose k) = n!/(k!(n-k)!) = n!/k!/(n-k)!
    return factorial_iterative(n) / factorial_iterative(k) / factorial_iterative(n - k);
}

// Print Pascal's triangle row
void print_pascals_triangle_row(int n) {
    for(int k = 0; k <= n; k++) {
        printf("%llu ", binomial(n, k));
    }
    printf("\n");
}

// Imperative GCD calculation using Euclidean algorithm
int gcd_iterative(int a, int b) {
    while(b != 0) {
        int tmp = b;
        b = a % b;
        a = tmp;
    }
    return a;
}

// Recursive GCD function
int gcd_recursive(int a, int b) {
    return (b == 0) ? a : gcd_recursive(b, a % b);
}

// Print all coprime numbers <= n
void print_coprimes(int n) {
    for(int i = 1; i <= n; i++) {
        if(gcd_iterative(i, n) == 1) {
            printf("%d ", i);
        }
    }
    printf("\n");
}

int main() {
    printf("Pascal's Triangle Row 5: ");
    print_pascals_triangle_row(5);
    printf("Factorial of 5 (iterative): %llu\n", factorial_iterative(5));
    printf("Factorial of 5 (recursive): %llu\n", factorial_recursive(5));
    printf("Binomial coefficient (5 choose 2): %llu\n", binomial(5, 2));
    printf("GCD(48, 18) = %d\n", gcd_iterative(48, 18));
    printf("GCD(48, 18) = %d\n", gcd_recursive(48, 18));
    printf("Coprime numbers up to 10: ");
    print_coprimes(10);
    return 0;
}