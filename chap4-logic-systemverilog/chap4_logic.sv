
// adder in system verilog
module adder4 (input logic [3:0] a,
            input logic [3:0] b,
            input logic cin, 
            output logic [3:0] sum, 
            output logic cout);
    assign sum = a + b + cin;
//    assign (cout, sum) = a + b + cin;
endmodule

// module in system verilog
module inv4 (input logic [3:0] a,
            output  logic [3:0] y);
    assign y = ~a;
endmodule