#include <cassert>
#include <iostream>
#include <cmath>
#include "point.hpp"
#include "circle.hpp"

// Helper function for floating-point comparison
bool approxEqual(double a, double b, double epsilon = 1e-10) {
    return std::abs(a - b) <= epsilon;
}

void testPointConstructors() {
    std::cout << "Testing Point constructors...\n";

    // Default constructor
    Point p1;
    assert(p1.getX() == 0 && p1.getY() == 0);

    // Parameterized constructor
    Point p2(3.5, -2.1);
    assert(approxEqual(p2.getX(), 3.5) && approxEqual(p2.getY(), -2.1));

    std::cout << "Point constructors tests passed!\n";
}

void testPointOperations() {
    std::cout << "Testing Point operations...\n";

    Point p(1, 1);

    // Test translation
    p.translate(2, 3);
    assert(approxEqual(p.getX(), 3) && approxEqual(p.getY(), 4));

    // Test rotation
    Point center(0, 0);
    p.rotate(center, 90);
    assert(approxEqual(p.getX(), -4) && approxEqual(p.getY(), 3));

    // Test reflection over point
    Point reflectPoint(1, 1);
    p.reflectOverPoint(reflectPoint);
    assert(approxEqual(p.getX(), 6) && approxEqual(p.getY(), -1));

    // Test reflection over axis (y = x)
    p.reflectOverAxis(1, -1, 0);
    assert(approxEqual(p.getX(), -1) && approxEqual(p.getY(), 6));

    std::cout << "Point operations tests passed!\n";
}

void testPointEdgeCases() {
    std::cout << "Testing Point edge cases...\n";

    Point p(1, 1);

    // Test rotation by 0, 360, -360 degrees
    Point original = p;
    p.rotate(Point(0, 0), 0);
    assert(approxEqual(p.getX(), original.getX()) && approxEqual(p.getY(), original.getY()));

    p.rotate(Point(0, 0), 360);
    assert(approxEqual(p.getX(), original.getX()) && approxEqual(p.getY(), original.getY()));

    p.rotate(Point(0, 0), -360);
    assert(approxEqual(p.getX(), original.getX()) && approxEqual(p.getY(), original.getY()));

    std::cout << "Point edge cases tests passed!\n";
}

void testCircleConstructors() {
    std::cout << "Testing Circle constructors...\n";

    // Default constructor
    Circle c1;
    assert(c1.getCenter().getX() == 0 && c1.getCenter().getY() == 0);
    assert(c1.getRadius() == 1);

    // Parameterized constructor
    Circle c2(Point(2, 3), 5);
    assert(approxEqual(c2.getCenter().getX(), 2) &&
           approxEqual(c2.getCenter().getY(), 3));
    assert(approxEqual(c2.getRadius(), 5));

    std::cout << "Circle constructors tests passed!\n";
}

void testCircleOperations() {
    std::cout << "Testing Circle operations...\n";

    Circle c(Point(0, 0), 2);

    // Test area and circumference
    assert(approxEqual(c.area(), M_PI * 4));
    assert(approxEqual(c.circumference(), M_PI * 4));

    // Test contains point
    Point inside(1, 1);
    Point outside(3, 3);
    assert(c.contains(inside));
    assert(!c.contains(outside));

    // Test circle relationships
    Circle c1(Point(0, 0), 5);
    Circle c2(Point(3, 0), 1);
    Circle c3(Point(10, 10), 1);

    assert(Circle::isInside(c1, c2));
    assert(!Circle::isInside(c1, c3));
    assert(Circle::areDisjoint(c1, c3));

    std::cout << "Circle operations tests passed!\n";
}

void testErrorConditions() {
    std::cout << "Testing error conditions...\n";

    // Test invalid circle radius
    try {
        Circle invalid(Point(0, 0), -1);
        assert(false); // Should not reach here
    } catch (const std::invalid_argument& e) {
        // Expected exception
    }

    // Test invalid line reflection
    try {
        Point p(1, 1);
        p.reflectOverAxis(0, 0, 1);
        assert(false); // Should not reach here
    } catch (const std::invalid_argument& e) {
        // Expected exception
    }

    std::cout << "Error conditions tests passed!\n";
}

int main() {
    try {
        testPointConstructors();
        testPointOperations();
        testPointEdgeCases();
        testCircleConstructors();
        testCircleOperations();
        testErrorConditions();

        std::cout << "\nAll tests passed successfully!\n";
        return 0;
    } catch (const std::exception& e) {
        std::cerr << "Test failed with error: " << e.what() << "\n";
        return 1;
    }
}