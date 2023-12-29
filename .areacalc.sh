#!/bin/bash

# Function to calculate the area and perimeter of a rectangle
calculate_rectangle() {
    local length=$1
    local width=$2

    local area=$(echo "scale=2; $length * $width" | bc)
    local perimeter=$(echo "scale=2; 2 * ($length + $width)" | bc)

    echo "Rectangle - Area: $area, Perimeter: $perimeter"
}

# Function to calculate the area and perimeter of a circle
calculate_circle() {
    local radius=$1

    local area=$(echo "scale=2; 3.14159 * $radius * $radius" | bc)
    local perimeter=$(echo "scale=2; 2 * 3.14159 * $radius" | bc)

    echo "Circle - Area: $area, Circumference: $perimeter"
}

# Function to calculate the area and perimeter of a triangle
calculate_triangle() {
    local side1=$1
    local side2=$2
    local side3=$3

    local s=$(echo "scale=2; ($side1 + $side2 + $side3) / 2" | bc)
    local area=$(echo "scale=2; sqrt($s * ($s - $side1) * ($s - $side2) * ($s - $side3))" | bc)
    local perimeter=$(echo "scale=2; $side1 + $side2 + $side3" | bc)

    echo "Triangle - Area: $area, Perimeter: $perimeter"
}

# Menu to select the shape
echo "Area and Perimeter Calculator"
echo "1. Rectangle"
echo "2. Circle"
echo "3. Triangle"

read -p "Select a shape (1-3): " choice

case $choice in
    1)
        read -p "Enter the length of the rectangle: " length
        read -p "Enter the width of the rectangle: " width
        calculate_rectangle $length $width
        ;;
    2)
        read -p "Enter the radius of the circle: " radius
        calculate_circle $radius
        ;;
    3)
        read -p "Enter the length of side 1: " side1
        read -p "Enter the length of side 2: " side2
        read -p "Enter the length of side 3: " side3
        calculate_triangle $side1 $side2 $side3
        ;;
    *)
        echo "Invalid choice. Please select a valid option (1-3)."
        ;;
esac
