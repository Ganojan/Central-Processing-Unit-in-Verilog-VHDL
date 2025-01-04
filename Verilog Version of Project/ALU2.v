module ALU2(
	input wire [7:0] A, B,         //Declaring inputs and outputs
	input wire [15:0] opcode,
	output reg [3:0] R1, R2,
	output reg negative
);

	reg [7:0] Reg1, Reg2, Result; //Declaring internal variables

	always @(opcode) begin //When opcode changes, the following block of code occurs
		
		//Assigning A and B to the internal variables
		Reg1 <= A;
		Reg2 <= B;
		
		case (opcode)
		
		16'b0000000000000001 : begin //When opcode is '0000000000000001', the following code executes
			
			Result <= Reg1 >> 2; //Shifting bits right twice
			
			//Filling shifted bits with input bit 1
			Result[6] <= 1;
			Result[7] <= 1;
			
			negative <= 0;
			
		end
		
		16'b0000000000000010 : begin
			
			Result <= (Reg1 - Reg2) + 8'b00000011; //Subtract B from A and then increment by 3
			negative <= 1;
			
		end
		
		16'b0000000000000100 : begin //Output maximum number out of A and B
			
			if(Reg1 > Reg2)
				Result <= Reg1;
			
			else
				Result <= Reg2;
			
			negative <= 0;
			
		end
		
		16'b0000000000001000 : begin
			
			Result[7] <= Reg2[3]; //Swap upper 4 bits of A with lower 4 bits of B
			Result[6] <= Reg2[2]; //Result consists of lower 4 bits of B as MSB and lower 4 bits of A as LSB
			Result[5] <= Reg2[1];
			Result[4] <= Reg2[0];
			Result[3] <= Reg1[3];
			Result[2] <= Reg1[2];
			Result[1] <= Reg1[1];
			Result[0] <= Reg1[0];
			
			negative <= 0;
			
		end
		
		16'b0000000000010000 : begin
			
			Result <= Reg1 + 8'b00000001; //Increment A by 1
			
			negative <= 0;
			
		end
		
		16'b0000000000100000 : begin
			
			Result <= Reg1 & Reg2; //A AND B Operation
			
			negative <= 0;
			
		end
		
		16'b0000000001000000 : begin
			
			Result[7] <= ~Reg1[7]; //Invert upper four bits of A
			Result[6] <= ~Reg1[6];
			Result[5] <= ~Reg1[5];
			Result[4] <= ~Reg1[4];
			Result[3] <= Reg1[3];
			Result[2] <= Reg1[2];
			Result[1] <= Reg1[1];
			Result[0] <= Reg1[0];
			
			negative <= 0;
			
		end
		
		16'b0000000010000000 : begin
			
			Result <= Reg2 << 3; //Rotate B 3 bits to the left
			Result[2] <= Reg2[7];
			Result[1] <= Reg2[6];
			Result[0] <= Reg2[5];
			
			negative <= 0;
			
		end
		
		endcase
		
		//Split Result into R1 and R2 to be displayed as two 4-bit results.
		R1 <= Result[3:0];
		R2 <= Result[7:4];
		
	end
	
endmodule