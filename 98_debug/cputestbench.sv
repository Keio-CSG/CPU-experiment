module testcpu2;
       reg [31:0]inst;
       reg clk;
       reg clk2;     
       cpu u3(.*);
     
      initial begin
      inst=32'b000000000010000010000000000000;
      clk=0;
      clk2 = 0;
      #1000 $stop;   
      end
      
      always #10 begin
        clk=clk+1;    
        clk2 = ~clk2;
      end
endmodule                
               
