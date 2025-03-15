#include <iostream>
#include <iomanip>
#include "circle.hpp"

int main() {
    try {
        std::cout << std::fixed << std::setprecision(2);

        // // Test Point operations
        // Point p1(3, 4), p2(6, 8);
        // p1.translate(1, 1);
        // p1.rotate(Point(0, 0), 90);

        // // Test Circle operations
        // Circle c1(Point(0, 0), 5);
        // Circle c2(Point(3, 3), 2);
        // c1.translate(1, 1);

        Point p1(3, 4), p2(6, 8);
        Circle c1(Point(0, 0), 5);
        Circle c2(Point(3, 3), 2);

        std::cout << "Distance: " << Point::distance(p1, p2) << "\n";
        std::cout << "Circle 1 Area: " << c1.area() << "\n";
        std::cout << "Circle 1 Circumference: " << c1.circumference() << "\n";
        std::cout << "Circle 2 inside Circle 1: " << Circle::isInside(c1, c2) << "\n";
        std::cout << "Circles are disjoint: " << Circle::areDisjoint(c1, c2) << "\n";

        // Test edge cases
        try {
            Circle invalid(Point(0, 0), -1);  // Should throw
        } catch (const std::invalid_argument& e) {
            std::cout << "Caught expected error: " << e.what() << "\n";
        }
    }
    catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << "\n";
        return 1;
    }
    return 0;
}
