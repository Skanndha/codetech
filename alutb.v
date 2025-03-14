module alu_tb();

reg clk, rst, 
reg [2:0]a, 
reg [2:0]b;
reg [2:0]op;
wire [3:0]result;

alu inst(clk,rst,a,b,op,result);

always@ #5 clk=~clk;

initial 
begin 
    clk=0;
    rst=1;
    op=0;
    #10 rst=0;
    #10 op=3'b001;
    #10 a=3'b001, b=3'b101;
    #10 op = 3'b000;
    #10 a=3'b101, b=3'b111;
    #10rst=1;
end

initial 
begin 
    $dumpfile("dump.vcd");
    $dumpvars();
    #700 $finish;
end 
endmodule 
