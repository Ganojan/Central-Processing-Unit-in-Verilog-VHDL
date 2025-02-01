module Moore_FSM(
	input data_in, //Declaring inputs and outputs of FSM
	input clock,
	input reset,
	output reg [3:0] currentstate,
	output reg [3:0] student_id
);
parameter  //Storing the 4-bit state values in easy-to-understand variables
	s0 = 4'b0000, // s0 State
	s1 = 4'b0001, // s1 State
	s2 = 4'b0010, // s2 State
	s3 = 4'b0011, // s3 State
	s4 = 4'b0100, // s4 State
	s5 = 4'b0101, // s5 State
	s6 = 4'b0110, // s6 State
	s7 = 4'b0111; // s7 State
  
	reg [3:0] next_state = s0; //Used for determining the next state of  the FSM; initially set to s0 to ensure the first state is s0.

always @(posedge clock, posedge reset) begin
 if(reset == 1) 
 currentstate <= s0; //When reset is on, currentstate is set to s0
 else
 currentstate <= next_state; //If reset is off, currentstate is nextstate
end 

always @(currentstate,data_in) begin
 case(currentstate)
 
 s0:begin //At currentstate s0, if data_in is 1, next state is s1; else if data_in is 0, next state is same state, s0. Corresponding student_id 'primary output' is attached the state.
	if(data_in == 1)
		next_state = s1;
	else
		next_state = s0;
	student_id = 4'b0000;
	end
 
 s1:begin
	if(data_in == 1)
		next_state = s2;
	else
		next_state = s1;
	student_id = 4'b0001;
	end

 s2:begin
	if(data_in == 1)
		next_state = s3;
	else
		next_state = s2;
	student_id = 4'b0010;
	end
 
 s3:begin
	if(data_in == 1)
		next_state = s4;
	else
		next_state = s3;
	student_id = 4'b0100;
	end
 
 s4:begin
	if(data_in == 1)
		next_state = s5;
	else
		next_state = s4;
	student_id = 4'b0010;
	end
 s5:begin
	if(data_in == 1)
		next_state = s6;
	else
		next_state = s5;
	student_id = 4'b1000;
	end

 s6:begin
	if(data_in == 1)
		next_state = s7;
	else
		next_state = s6;
	student_id = 4'b0110;
	end

 s7:begin
	if(data_in == 1)
		next_state = s0;
	else
		next_state = s7;
	student_id = 4'b0101;
	end

 default:next_state = s0;

 endcase
end
endmodule
