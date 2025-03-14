module alu(
    input clk,
    input rst,
    input [2:0]a, 
    input [2:0]b,
    input [2:0]op,
    output reg [3:0]result
);

parameter add=3'b000, sub=3'b001, andd=3'b010, orr=3'b011, nott=3'b100; 

always@(posedge clk)
begin
  if(rst)
        result<=0;
  else 
    begin 
        case(op)
        add: result<= a+b;
        sub: result<= a-b;
        andd: result<= a&b;
        orr: result<= a|b;
        nott: 
        begin
                if(a)
                     result<= ~a;
                else if(b)
                    result<= ~b;
                else 
                    result<=0;
        end 
    end 
end 


endmodule 