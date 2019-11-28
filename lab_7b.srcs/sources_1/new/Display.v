module Display(REG_2, REG_3, BL, BR, CLK, seg, Digit);
input[31:0] REG_2, REG_3;
input BL, BR, CLK;
output[6:0] seg;
output[3:0] Digit;
reg[6:0] seg;
wire[6:0] seg0, seg1, seg2, seg3;
reg[3:0] Digit;
reg[19:0] cnt;
wire[3:0] val0, val1, val2, val3;
wire[1:0] sel;
wire[1:0] dig;

assign dig = cnt[19:18];
assign sel = {BL, BR};

initial begin
    cnt = 0;
end

MUX4 m0(REG_2[3:0], REG_2[19:16], REG_3[3:0], REG_3[19:16], sel, val0);
MUX4 m1(REG_2[7:4], REG_2[23:20], REG_3[7:4], REG_3[23:20], sel, val1);
MUX4 m2(REG_2[11:8], REG_2[27:24], REG_3[11:8], REG_3[27:24], sel, val2);
MUX4 m3(REG_2[15:12], REG_2[31:28], REG_3[15:12], REG_3[31:28], sel, val3);

SEG7 sega(val0, CLK, seg0);
SEG7 segb(val1, CLK, seg1);
SEG7 segc(val2, CLK, seg2);
SEG7 segd(val3, CLK, seg3);

always @(posedge CLK) begin
    cnt = cnt + 1;
    case(dig)
        2'b00 : begin
                    Digit <= 4'b1110;
                    seg <= seg0;
                end
        2'b01 : begin
                    Digit <= 4'b1101;
                    seg <= seg1;
                end
        2'b10 : begin
                    Digit <= 4'b1011;
                    seg <= seg2;
                end
        2'b11 : begin
                    Digit <= 4'b0111;
                    seg <= seg3;
                end
    endcase
end

endmodule
