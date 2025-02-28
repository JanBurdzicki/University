# Jan Burdzicki
# List: 1
# Task: 1, 2

class MathUtils:
    """Class containing mathematical utility functions."""

    @staticmethod
    def factorial_iterative(n: int) -> int:
        """Computes factorial iteratively."""
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result

    @staticmethod
    def factorial_recursive(n: int) -> int:
        """Computes factorial recursively."""
        return 1 if n == 0 else n * MathUtils.factorial_recursive(n - 1)

    @staticmethod
    def binomial(n: int, k: int) -> int:
        """Computes binomial coefficient using factorial."""
        return MathUtils.factorial_iterative(n) // (MathUtils.factorial_iterative(k) * MathUtils.factorial_iterative(n - k))

    @staticmethod
    def pascals_triangle_row(n: int):
        """Computes nth row of Pascal's Triangle."""
        return [MathUtils.binomial(n, k) for k in range(n + 1)]

    @staticmethod
    def gcd_iterative(a: int, b: int) -> int:
        """Computes the greatest common divisor iteratively."""
        while b:
            a, b = b, a % b
        return a

    @staticmethod
    def gcd_recursive(a: int, b: int) -> int:
        """Computes the greatest common divisor recursively."""
        return a if b == 0 else MathUtils.gcd_recursive(b, a % b)

    @staticmethod
    def print_coprimes(n: int):
        """Computes coprime numbers up to n."""
        return [i for i in range(1, n + 1) if MathUtils.gcd_iterative(i, n) == 1]

if __name__ == "__main__":
    print("Pascal's Triangle Row 5:", MathUtils.pascals_triangle_row(5))
    print("Factorial of 5 (iterative):", MathUtils.factorial_iterative(5))
    print("Factorial of 5 (recursive):", MathUtils.factorial_recursive(5))
    print("Binomial coefficient (5 choose 2):", MathUtils.binomial(5, 2))
    print("GCD(48, 18) =", MathUtils.gcd_iterative(48, 18))
    print("GCD(48, 18) =", MathUtils.gcd_recursive(48, 18))
    print("Coprimes up to 10:", MathUtils.print_coprimes(10))

