
module add(input logic[31:0]a,
           input logic[31:0]b,
           output logic[31:0]y1);
   assign y1=a+b;
   endmodule

   module sub(input logic[31:0]a,
           input logic[31:0]b,
           output logic[31:0]y2);
   assign y2=a+~b+1;
   endmodule
   
   module kake(input logic[31:0]a,
           input logic[31:0]b,
           output logic[31:0]y3);
   assign y3=a*b;
   endmodule
   
   module wari(input logic[31:0]a,
           input logic[31:0]b,
           output logic[31:0]y4);
   assign y4=a/b;
   endmodule
   
   module mux4(input logic[31:0]y1,y2,y3,y4,
               input logic[1:0]sel,
               output logic[31:0]out);   
   assign out=sel[1]?(sel[0]?y4:y3):(sel[0]?y2:y1);
   endmodule

module alu(input logic[31:0]a,
           input logic[31:0]b,
           input logic[1:0]sel,
           
           output logic[31:0]y
           );
	logic[31:0]y1;
        logic[31:0]y2;
        logic[31:0]y3;
        logic[31:0]y4;
                
   add u1(.a(a), .b(b), .y1(y1));
   sub u2(.a(a), .b(b),.y2(y2));
   kake u3(.a(a), .b(b),.y3(y3));
   wari u4(.a(a), .b(b),.y4(y4));
   mux4 u5(.y1(y1), .y2(y2),.y3(y3),.y4(y4),.sel(sel),.out(y));
endmodule

module regista(input logic[4:0]addrw,
               input logic writeen,
               input logic clk, 
               input logic[31:0]writeint,
               input logic[4:0]addr1,
               input logic[4:0]addr2, 
               output logic[31:0]RD1,
               output logic[31:0]RD2);

     logic[31:0]DATA[31:0];

    always @(posedge clk) begin
        DATA[0] = 16;
        DATA[1] = 6;
        DATA[2] = 3;
    end
    
      assign RD1=DATA[addr1];
      assign RD2=DATA[addr2];
      always @(posedge clk)
            DATA[addrw] <= (writeen) ? writeint:0;
endmodule

module cpu(input logic clk,
           input logic[31:0]inst);

       logic[31:0]writeint,RD1,RD2,a,y;
       logic[4:0]addr1,addrw,addr2;   
       //logic[31:0]DATA[31:0];
       logic[1:0]sel;
       logic writeen;
       assign writeen = (inst[2:0] < 4);
       assign sel = inst[1:0];

       alu u6(.a(a),.b(b),.y(y),.sel(sel));
       
       regista u7(.addr1(inst[12:8]),.addr2(inst[17:13]),.addrw(inst[22:18])
                  ,.writeint(y),.clk(clk),.RD1(a),.RD2(b),.writeen(writeen));

endmodule    
                     
                     




