module alu_tb();

reg clk, rst; 
reg [3:0] a; 
reg [3:0] b;
reg [2:0] op; // Corrected to 3-bit operation since your ALU uses 3-bit opcodes
wire [3:0] result;

alu inst(clk, rst, a, b, op, result);

// Generate clock with period 10 time units
always #5 clk = ~clk;

initial 
begin 
    clk = 0;
    rst = 1;
    a = 4'b0000;
    b = 4'b0000;
    op = 3'b000;
    
    #15 rst = 0; // Extended reset duration to ensure stability

    // Test Addition
    #10 op = 3'b000; a = 4'b0011; b = 4'b0101; // 3 + 5
    #10 op = 3'b000; a = 4'b1111; b = 4'b0001; // 15 + 1 (overflow case)

    // Test Subtraction
    #10 op = 3'b001; a = 4'b0110; b = 4'b0010; // 6 - 2
    #10 op = 3'b001; a = 4'b0001; b = 4'b0010; // 1 - 2 (negative case)

    // Test AND
    #10 op = 3'b010; a = 4'b1100; b = 4'b1010; // AND operation

    // Test OR
    #10 op = 3'b011; a = 4'b1100; b = 4'b1010; // OR operation

    // Test NOT
    #10 op = 3'b100; a = 4'b0101; b = 4'b0000; // NOT a
    #10 op = 3'b100; a = 4'b0000; b = 4'b1010; // NOT b

    // Test edge cases
    #10 a = 4'b0000; b = 4'b0000; op = 3'b000; // Adding zeroes
    #10 a = 4'b1111; b = 4'b1111; op = 3'b001; // Subtracting all ones

    // Reset in between
    #10 rst = 1;
    #10 rst = 0;

    // Test Random Values
    #10 op = 3'b000; a = 4'b1010; b = 4'b0110; 
    #10 op = 3'b010; a = 4'b1001; b = 4'b0011;

    // Finish simulation
    #50 $finish;
end

initial 
begin 
    $dumpfile("dump.vcd");
    $dumpvars();
end 

endmodule
