#ifndef POINT_HPP
#define POINT_HPP

#include <cmath>
#include <stdexcept>

/**
 * @class Point
 * @brief Represents a point in 2D space with x and y coordinates
 *
 * This class provides functionality for basic geometric operations on points,
 * including translation, rotation, and reflection.
 */
class Point {
private:
    double x, y;
    static constexpr double EPSILON = 1e-10;

public:
    /**
     * @brief Default constructor. Creates a point at origin (0,0)
     */
    Point();

    /**
     * @brief Parameterized constructor
     * @param _x The x-coordinate of the point
     * @param _y The y-coordinate of the point
     */
    Point(double _x, double _y);

    double getX() const;
    double getY() const;
    void setX(double _x);
    void setY(double _y);

    /**
     * @brief Translates the point by given offsets
     * @param dx The offset in x direction
     * @param dy The offset in y direction
     * @throws std::invalid_argument if dx or dy are not finite numbers
     */
    void translate(double dx, double dy);

    /**
     * @brief Rotates the point around a center point by a given angle
     * @param center The point to rotate around
     * @param angle The rotation angle in degrees (positive = counterclockwise)
     * @throws std::invalid_argument if angle is not a finite number
     * @note Angle is in degrees, not radians
     */
    void rotate(const Point& center, double angle);

    /**
     * @brief Reflects the point over a center point
     * @param center The point to reflect over
     * @note This operation is equivalent to a 180-degree rotation around the center point
     */
    void reflectOverPoint(const Point& center);

    /**
     * @brief Reflects the point over a line defined by Ax + By + C = 0
     * @param A The x coefficient in the line equation
     * @param B The y coefficient in the line equation
     * @param C The constant term in the line equation
     * @throws std::invalid_argument if the line equation is invalid (A=B=0)
     * @throws std::invalid_argument if any parameter is not finite
     */
    void reflectOverAxis(double A, double B, double C);

    /**
     * @brief Calculates the Euclidean distance between two points
     * @param p1 The first point
     * @param p2 The second point
     * @return The distance between p1 and p2
     */
    static double distance(const Point& p1, const Point& p2);

	friend std::ostream& operator<<(std::ostream& os, const Point& p);
};

#endif // POINT_HPP
