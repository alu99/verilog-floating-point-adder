# verilog-floating-point-adder
Verilog program that calculates the sum of 2 floating point binary numbers. Unfortunately, I can't include my source code since it would be a violation of academic integrity policies to post my work online.

## Course Background
In my Digital Circuits and Systems laboratory course, we spent an entire semester learning about and utilizing Verilog. We  programmed various digital systems in Verilog like counters, adders, and multipliers and loaded them onto the Basys3 FPGA board. I uploaded my floating point adder project to Github because it best encapulates the core concepts that we learned throughout the semester. Please learn more about it below!

## Floating Point Adder
For this project, I implemented an 8 bit floating point adder using the controller/datapath model. The user first inputs 2 8-bit floating point numbers using the 16 switches on the FPGA. The FPGA displays the 2 inputs on its 4 digit 7 segment display. When the user presses a button on the FPGA, the algorithm computes the sum and displays it on the 4 digit 7 segment display.

### Organization of 8-bit floating point numbers
An 8-bit floating point representation of the number `-1.110 * 2^1` would look like this: `1 1000 110`.
* The leftmost bit is the sign bit. If it's `1`, the number is negative. If it's `0`, the number is positive.
* The middle 4 bits are the exponent. It is in excess 7 form, which means we subtract 7 from the exponent value. In the example above, `1000` = `8` in base 10. `8 - 7 = 1`. Therefore, our exponent is `2^1`. 
* The last 3 bits are the mantissa (or significand). They represent the digits to the right of the decimal point. Floating point numbers are normalized so that the digit to the left of the decimal point is always 1. That's why we don't need an extra bit to store that 1.

### Adding 2 8-bit floating point numbers
Below is a very high level description about the algorithm to sum 2 floating point numbers.
![image](https://user-images.githubusercontent.com/13570258/69774648-82f94f00-1164-11ea-9389-93518111464b.png)
Since I don't want to clutter the README with a very lengthy and verbose explanation, please do a quick Google search if you want to learn more about the algorithm!

### Controller/datapath model
The controller/datapath model separates the logic into 2 distinct parts: the `datapath` and the `controller`.
* Datapath: Contains the registers and the combinational logic that the system needs to operate. Executes certain steps of combinational logic if it receives a certain input signal fed from the controller. Outputs signals to controller if certain conditions are met.
* Controller: Contains a finite state machine that represents the steps of the algorithm. At a certain step, the controller will output signals specific to that step to the datapath to dictate how the datapath will operate for that step. When the controller receives inputs from the datapath, it will advance to the next step. 

## Vivado Simulations
Below are some simulation outputs that capture the floating point adder in action.
![image](https://user-images.githubusercontent.com/13570258/69775399-9dccc300-1166-11ea-9973-35700ba49cc2.png)
![image](https://user-images.githubusercontent.com/13570258/69775425-b0df9300-1166-11ea-8fbb-26593a5135b1.png)

## FPGA Demo
Our inputs:
* a = 0 1000 100 (3)
* b = 1 1000 000 (-2)

![image](https://user-images.githubusercontent.com/13570258/69775848-1f712080-1168-11ea-83dc-e2c6a7e05dc3.png)

* sum = 0 0111 000 (1)

![image](https://user-images.githubusercontent.com/13570258/69775885-40d20c80-1168-11ea-84e4-77085f064204.png)




