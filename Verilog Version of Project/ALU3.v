module ALU3(
	input wire [15:0] opcode,    //Declaring inputs and outputs
	input wire [3:0] studentID,
	output reg [3:0] answer
);

	always @(opcode) begin   //When opcode changes, the following block of code occurs
		
		//Checking for odd parity in the student ID
		//If the XOR of all the studentID digits (in binary) is 1: there is odd parity; else if it's 0: there is even parity
		if((studentID[3] ^ studentID[2] ^ studentID[1] ^ studentID[0]) == 1)
			answer <= 4'b0001;
		else
			answer <= 4'b0000;
		
	end

endmodule