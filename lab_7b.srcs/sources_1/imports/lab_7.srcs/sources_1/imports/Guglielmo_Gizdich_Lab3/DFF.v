module DFF(D, CLK, Q, QN);
input D;
input CLK;
output Q, QN;
reg Q, QN;

initial begin
	Q = 0;
	QN = 1;
end

always @(posedge CLK) begin

	Q <= D;
	QN <= ~D;

end
endmodule
