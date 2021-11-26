module cpu_register(
    input logic [4:0] addr1,
    input logic [4:0] addr2,
    input logic [4:0] addrw,
    input logic writeen,
    input logic [31:0] writeint,
    input logic clk,
    output logic [31:0] RD1,
    output logic [31:0] RD2,
)
    logic [31:0] DATA [31:0];

    assign RD1 = DATA[addr1];
    assign RD2 = DATA[addr2];
    always_ff @(posedge clk)
        if writeen assign DATA[addrw] <= writeint;
        
endmodule