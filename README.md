# Central-Processing-Unit-in-Verilog-VHDL
This repository contains the implementation of a simple Central Processing Unit (CPU) designed using Verilog and VHDL. Utilising important components of digital logic, including latches, a Moore FSM, ALU, decoder, and seven-segment displays, I was able to create a simple CPU that performs basic arithmetic and logical functions.

## Project Overview  
The CPU integrates several key components to perform arithmetic and logical operations effectively:  

- **Latches for Memory**: Used for data storage.  
- **Moore Finite State Machine (FSM)**: Governs the control flow.  
- **Decoder**: Decodes instruction sets for the CPU.  
- **Seven-Segment Displays**: Provides a visual representation of outputs.  
- **Arithmetic Logic Unit (ALU)**: Core component performing arithmetic and logical operations.  

## Features  
- Rewritten from VHDL to Verilog for improved design and functionality.  
- Modular structure allowing individual testing and debugging of components.  
- Waveform-based testing and validation using Quartus II, ensuring the accurate operation of individual components and the CPU as a whole.  

## Tools Used  
- **Quartus II**: Used for development, simulation, and waveform analysis.  

## How It Works  
The components of this CPU work in unison to execute operations as instructed:  

1. The **decoder** interprets incoming instructions.  
2. The **Moore FSM** manages the control signals to coordinate data flow between components.  
3. Data storage and retrieval occur in **latches for memory**.  
4. The **ALU core** executes the arithmetic and logical operations.  
5. Outputs are displayed on the **seven-segment displays** for user interpretation.  
