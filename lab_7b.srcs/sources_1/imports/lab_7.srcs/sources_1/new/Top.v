module Top(CLK, SW0, SW1, SW2, BtnL, BtnR, REG_LED, Digit, seg);
  input CLK;
  input SW0, SW1, SW2, BtnL, BtnR;
  wire[6:0] A_Out;
  wire[31:0] D_Out;
  output[7:0] REG_LED;
  output[3:0] Digit;
  output[6:0] seg;
  wire[2:0] val;
  wire[31:0] REG_1, REG_2, REG_3;
  wire[2:0] state;
  wire slowCLK, BL, BR;
  
  assign val = {SW2, SW1, SW0};

  Debounce dbl(BtnL, CLK, BL);
  Debounce dbr(BtnR, CLK, BR);
  slowCLK sl(.CLK(CLK), .HALT(), .slowCLK(slowCLK));
  Complete_MIPS mips(.CLK(CLK), .RST(), .val(val), .A_Out(A_Out), .D_Out(D_Out), .REG_1(REG_1), .REG_2(REG_2), .REG_3(REG_3), .state(state));
  Display dis(REG_2, REG_3, BL, BR, CLK, seg, Digit);
  
  assign REG_LED = REG_1[7:0];

endmodule


module slowCLK(CLK, HALT, slowCLK);
    input CLK, HALT;
    output slowCLK;
    reg slowCLK;
    integer cnt;
    
    initial begin
        slowCLK = 0;
        cnt = 0;
    end
    
    always @(posedge CLK) begin
        if(~HALT) begin
            cnt = cnt + 1;
            if(cnt == 10000000) begin
                slowCLK = ~slowCLK;
                cnt = 0;
            end else begin end
        end else begin end
    end
endmodule
