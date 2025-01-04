module RegisterLatch(
	input wire clk,
	input wire [7:0] D,
	input wire reset,
	output reg [7:0] Q
);

	always @(clk, reset) begin
		
		if (reset == 1)
			Q <= 8'b00000000;
		
		else if (clk == 1)
			Q <= D;
		
	end
	
endmodule