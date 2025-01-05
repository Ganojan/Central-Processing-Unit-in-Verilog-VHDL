module ALU1(
	input wire [7:0] A, B,       //Declaring inputs and outputs
	input wire [15:0] opcode,
	output reg [3:0] R1, R2,
	output reg negative
);

	reg [7:0] Reg1, Reg2, Result; //Declaring internal variables

	always @(opcode) begin   //When opcode changes, the following block of code occurs
		
		//Assigning A and B to the internal variables
		Reg1 <= A;
		Reg2 <= B;
		
		case (opcode)
		
		16'b0000000000000001 : begin  //When opcode is '0000000000000001', the following code executes
			
			//Add A and B together
			reg [7:0] TempResult;
			
			TempResult <= Reg1 + Reg2;
			
			if(TempResult[3:0] >= 4'b1010)
				Result <= {TempResult[7:4] + 4'b0001, TempResult[3:0] - 4'b1010};
			else
				Result <= TempResult;
			
			negative <= 0;
			
		end
		
		16'b0000000000000010 : begin //Perform A - B
			
			if(Reg1 < Reg2) begin
				
				Result <= Reg2 - Reg1;
				negative <= 1;
				
			end
			
			else begin
				Result <= Reg1 - Reg2;
				negative <= 0;
			end
			
		end
		
		16'b0000000000000100 : begin //NOT A Operation
			Result <= ~Reg1;
			negative <= 0;
		end
		
		16'b0000000000001000 : begin //A NAND B Operation
			Result <= ~(Reg1 & Reg2);
			negative <= 0;
		end
		
		16'b0000000000010000 : begin //A NOR B Operation
			Result <= ~(Reg1 | Reg2);
			negative <= 0;
		end
		
		16'b0000000000100000 : begin //A AND B Operation
			Result <= Reg1 & Reg2;
			negative <= 0;
		end
		
		16'b0000000001000000 : begin //A XOR B Operation
			Result <= Reg1 ^ Reg2;
			negative <= 0;
		end
		
		16'b0000000010000000 : begin //A OR B Operation
			Result <= Reg1 | Reg2;
			negative <= 0;
		end
		
		endcase
		
		//Split Result into R1 and R2 to be displayed as two 4-bit results.
		R1 <= Result[3:0];
		R2 <= Result[7:4];
		
	end
	
endmodule
