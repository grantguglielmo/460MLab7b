module MUX4(In1, In2, In3, In4, Sel, OUT);
input [3:0] In1, In2, In3, In4;
input [1:0] Sel;
output [3:0] OUT;
reg [3:0] OUT;

always @(*) begin
    case(Sel)
        2'b00 : OUT = In1;
        2'b01 : OUT = In2;
        2'b10 : OUT = In3;
        2'b11 : OUT = In4;
    endcase
end
endmodule
