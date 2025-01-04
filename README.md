# Central-Processing-Unit-in-Verilog-VHDL
This repository contains the implementation of a simple Central Processing Unit (CPU) designed using Verilog and VHDL. Utilising important components of digital logic, including latches, a Moore FSM, ALU, decoder, and seven-segment displays, I was able to create a simple CPU that performs basic arithmetic and logical functions. The project was originally written in VHDL code as part of the final project for my digital circuit course. I decided to write the program in Verilog code and also refine the program such that it works flawlessly without any issues at all.

## Project Overview  
The CPU integrates several key components to perform arithmetic and logical operations effectively:  

- **Latches**: Used for data storage and later retrieval.
- **Moore Finite State Machine (FSM)**: Governs the control flow in orderly manner.  
- **Decoder**: Decodes instruction sets for the CPU and outputs the appropriate instructions.
- **Arithmetic Logic Unit (ALU)**: Core component performing arithmetic and logical operations.  
- **Seven-Segment Displays**: Provides a visual representation of outputs.

## Feature

- **Synchronous Operation**: Common clock signal allows for all components in the circuit to operate instantaneously upon command.

## Tool Used
- **Quartus II**: Used for development, simulation, and waveform analysis to verify the operation of the CPU.

## How It Works  
The components of this CPU work in unison to execute operations as instructed:  

1. The 2 **latches** capture the 8-bit inputs to be used in the calculations.
2. The **Moore FSM** manages the control signals to coordinate data flow in order.  
3. The **decoder** interprets incoming signal from FSM and gives instruction to the ALU on what calculation to perform. 
4. The **ALU core** retrieves input from the **latches** and **decoder** and executes the arithmetic and logical operations.  
6. Outputs are displayed on the **seven-segment displays** for user interpretation.
