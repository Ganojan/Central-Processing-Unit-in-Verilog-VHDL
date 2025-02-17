module sseg_with_negative(
	input wire [3:0] bcd,
	input wire negative,
	output reg [0:6] leds,
	output reg [0:6] negativeled
);

	always @(negative or bcd) begin
	
		if (negative == 1)
			negativeled <= 7'b0000001;
		else
			negativeled <= 7'b0000000;
			
		case(bcd)
			4'b0000 : leds <= 7'b1111110;
			4'b0001 : leds <= 7'b0110000;
			4'b0010 : leds <= 7'b1101101;
			4'b0011 : leds <= 7'b1111001;
			4'b0100 : leds <= 7'b0110011;
			4'b0101 : leds <= 7'b1011011;
			4'b0110 : leds <= 7'b1011111;
			4'b0111 : leds <= 7'b1110000;
			4'b1000 : leds <= 7'b1111111;
			4'b1001 : leds <= 7'b1111011;
			4'b1010 : leds <= 7'b1110111;
			4'b1011 : leds <= 7'b0011111;
			4'b1100 : leds <= 7'b1001110;
			4'b1101 : leds <= 7'b0111101;
			4'b1110 : leds <= 7'b1001111;
			4'b1111 : leds <= 7'b1000111;
			default : leds <= 7'b0000000;
			endcase		
		end
endmodule