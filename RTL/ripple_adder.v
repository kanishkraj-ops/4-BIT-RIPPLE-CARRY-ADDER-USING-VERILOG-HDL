`timescale 1ns / 1ps

module ripple_adder(X0,X1,Y,COUT);
input [3:0] X0,X1;
output [3:0]Y;
output COUT;

wire c1,c2,c3;
//Instantiate full adder
full_adder fa0(.A(X0[0]),.B(X1[0]),.C(1'b0),.S(Y[0]),.COUT(c1));

full_adder fa1(.A(X0[1]),.B(X1[1]),.C(c1),.S(Y[1]),.COUT(c2));

full_adder fa2(.A(X0[2]),.B(X1[2]),.C(c2),.S(Y[2]),.COUT(c3));

full_adder fa3(.A(X0[3]),.B(X1[3]),.C(c3),.S(Y[3]),.COUT(COUT));


endmodule


module full_adder(A,B,C,S,COUT);
input A,B,C;
output S, COUT;

assign S = A^B^C;
assign COUT = (A&B)|(B&C)|(C&A);

endmodule 