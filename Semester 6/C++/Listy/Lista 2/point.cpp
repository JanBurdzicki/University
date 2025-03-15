#include "point.hpp"

Point::Point() : x(0), y(0) {}

Point::Point(double x, double y) : x(x), y(y) {}

double Point::getX() const { return x; }
double Point::getY() const { return y; }

void Point::setX(double _x) { this->x = _x; }
void Point::setY(double _y) { this->y = _y; }

void Point::translate(double dx, double dy) {
    // Check for NaN or infinity
    if (!std::isfinite(dx) || !std::isfinite(dy)) {
        throw std::invalid_argument("Translation values must be finite numbers");
    }
    x += dx;
    y += dy;
}

void Point::rotate(const Point& center, double angle) {
    if (!std::isfinite(angle)) {
        throw std::invalid_argument("Rotation angle must be a finite number");
    }

    double rad = angle * M_PI / 180.0;
    double cosA = std::cos(rad);
    double sinA = std::sin(rad);

    double dx = x - center.getX();
    double dy = y - center.getY();

    x = cosA * dx - sinA * dy + center.getX();
    y = sinA * dx + cosA * dy + center.getY();
}

void Point::reflectOverPoint(const Point& center) {
    x = 2 * center.getX() - x;
    y = 2 * center.getY() - y;
}

void Point::reflectOverAxis(double A, double B, double C) {
    static const double EPSILON = 1e-10;

    // Check for NaN or infinity
    if (!std::isfinite(A) || !std::isfinite(B) || !std::isfinite(C)) {
        throw std::invalid_argument("Line equation coefficients must be finite numbers");
    }

    // Check if line equation is valid
    if (std::abs(A) < EPSILON && std::abs(B) < EPSILON) {
        throw std::invalid_argument("Invalid line equation: both A and B coefficients are zero");
    }

    double D = (A * x + B * y + C) / (A * A + B * B);
    x = x - 2 * A * D;
    y = y - 2 * B * D;
}

double Point::distance(const Point& p1, const Point& p2) {
    // more numerically stable than:
    // std::sqrt(std::pow(p2.getX() - p1.getX(), 2) + std::pow(p2.getY() - p1.getY(), 2));
    return std::hypot(p2.getX() - p1.getX(), p2.getY() - p1.getY());
}
