
module flop(
    input logic [3:0] d,
    input logic clk,
    output logic [3:0] q
);

    always_ff @(posedge clk)
        q <= d;
    
endmodule