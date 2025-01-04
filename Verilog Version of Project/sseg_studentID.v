module sseg_studentID(
	input wire [3:0] bcd,
	output reg [0:6] led
);

	always @(bcd) begin
		
		case(bcd)
			4'b0000 : led <= 7'b1111110;
			4'b0001 : led <= 7'b0110000;
			4'b0010 : led <= 7'b1101101;
			4'b0011 : led <= 7'b1111001;
			4'b0100 : led <= 7'b0110011;
			4'b0101 : led <= 7'b1011011;
			4'b0110 : led <= 7'b1011111;
			4'b0111 : led <= 7'b1110000;
			4'b1000 : led <= 7'b1111111;
			4'b1001 : led <= 7'b1111011;
			4'b1010 : led <= 7'b1110111;
			4'b1011 : led <= 7'b0011111;
			4'b1100 : led <= 7'b1001110;
			4'b1101 : led <= 7'b0111101;
			4'b1110 : led <= 7'b1001111;
			4'b1111 : led <= 7'b1000111;
			default : led <= 7'b0000000;
			endcase		
		end
endmodule