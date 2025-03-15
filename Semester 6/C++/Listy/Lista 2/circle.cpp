#include "circle.hpp"

Circle::Circle() : center(Point()), radius(1) {}

Circle::Circle(Point _center, double _radius) {
    if (_radius <= 0) {
        throw std::invalid_argument("Radius must be positive.");
    }
    this->center = _center;
    this->radius = _radius;
}

Point Circle::getCenter() const { return center; }
double Circle::getRadius() const { return radius; }

void Circle::setCenter(Point _center) { this->center = _center; }
void Circle::setRadius(double _radius) {
    if (_radius <= 0) {
        throw std::invalid_argument("Radius must be positive.");
    }
    this->radius = _radius;
}

void Circle::translate(double dx, double dy) {
    center.translate(dx, dy);
}

void Circle::rotate(const Point& pivot, double angle) {
    center.rotate(pivot, angle);
}

void Circle::reflectOverPoint(const Point& pivot) {
    center.reflectOverPoint(pivot);
}

void Circle::reflectOverAxis(double A, double B, double C) {
    center.reflectOverAxis(A, B, C);
}

double Circle::circumference() const {
    return 2 * M_PI * radius;
}

double Circle::area() const {
    return M_PI * radius * radius;
}

bool Circle::contains(const Point& p) const {
    return Point::distance(center, p) <= radius;
}

bool Circle::isInside(const Circle& c1, const Circle& c2) {
    return Point::distance(c1.center, c2.center) + c2.radius <= c1.radius;
}

bool Circle::areDisjoint(const Circle& c1, const Circle& c2) {
    return Point::distance(c1.center, c2.center) > (c1.radius + c2.radius);
}

