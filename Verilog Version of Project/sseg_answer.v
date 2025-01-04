module sseg_answer(
	input wire [3:0] bcd,
	output reg [0:6] answerled
);

	always @(bcd) begin
		
		case(bcd)
			4'b0000 : answerled <= 7'b1110110; //N for no (spelled as lowercase n)
			4'b0001 : answerled <= 7'b0111011; //Y for yes
			default : answerled <= 7'b0000000; //No LED output otherwise
		endcase		
	end
endmodule