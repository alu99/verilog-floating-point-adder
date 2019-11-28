# verilog-floating-point-adder
Verilog program that calculates the sum of 2 floating point binary numbers

## Course Background
In my Digital Circuits and Systems laboratory course, we spent an entire semester learning about and utilizing Verilog. We  programmed various digital systems in Verilog like counters, adders, and multipliers and loaded them onto the Basys3 FPGA board. I uploaded my floating point adder project to Github because it best encapulates the core concepts that we learned throughout the semester. Please learn more about it below!

## Floating Point Adder
For this project, I implemented an 8 bit floating point adder using the controller/datapath model.

### Organization of 8-bit floating point numbers
An 8-bit floating point representation of the number -1.110 * 2^1 would look like this: 1 1110 110.
* The leftmost bit is the sign bit. If it's 1, the number is negative. If it's 0, it's positive.
* The middle 4 bits are the exponent. It is in excess 7 form, which means we subtract 7 from the exponent value. In the example above, 1110 = 8 in base 10. 8 - 7 = 1. Therefore, our exponent is 2^1. 
* The last 3 bits are the mantissa. They represent the digits to the right of the decimal point. Floating point numbers are normalized so that the digit to the left of the decimal point is always 1. That's why we don't need an extra bit to store that 1.

### Adding 2 8-bit floating point numbers


### Controller/datapath model
