#ifndef CIRCLE_HPP
#define CIRCLE_HPP

#include "point.hpp"

/**
 * @class Circle
 * @brief Represents a circle in 2D space defined by a center point and radius
 *
 * This class provides functionality for basic geometric operations on circles,
 * including translation, rotation, and various geometric queries.
 */
class Circle {
private:
    Point center;
    double radius;

public:
    Circle();
    Circle(Point _center, double _radius);

    Point getCenter() const;
    double getRadius() const;
    void setCenter(Point _center);
    void setRadius(double _radius);

    void translate(double dx, double dy);
    void rotate(const Point& pivot, double angle);
    void reflectOverPoint(const Point& pivot);
    void reflectOverAxis(double A, double B, double C);

    /**
     * @brief Calculates the circumference of the circle
     * @return The circumference value (2πr)
     */
    double circumference() const;

    /**
     * @brief Calculates the area of the circle
     * @return The area value (πr²)
     */
    double area() const;

    /**
     * @brief Checks if a point lies within or on the circle
     * @param p The point to check
     * @return true if the point is inside or on the circle, false otherwise
     */
    bool contains(const Point& p) const;

    /**
     * @brief Checks if one circle is completely inside another
     * @param c1 The outer circle
     * @param c2 The inner circle
     * @return true if c2 is completely inside c1, false otherwise
     * @note The circles may be tangent internally
     */
    static bool isInside(const Circle& c1, const Circle& c2);

    /**
     * @brief Checks if two circles are completely separate
     * @param c1 The first circle
     * @param c2 The second circle
     * @return true if circles have no points in common, false otherwise
     */
    static bool areDisjoint(const Circle& c1, const Circle& c2);
};

#endif // CIRCLE_HPP
