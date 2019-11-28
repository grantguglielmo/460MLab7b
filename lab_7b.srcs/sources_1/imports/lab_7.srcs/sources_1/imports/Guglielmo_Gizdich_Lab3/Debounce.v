module Debounce(In, CLK, Out);
input In, CLK;
output Out;
wire o1, o2, o3n;

DFF ff1(.D(In), .CLK(CLK), .Q(o1), .QN());
DFF ff2(.D(o1), .CLK(CLK), .Q(Out), .QN());

endmodule
