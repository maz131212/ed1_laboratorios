///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 05 - SEPTIEMBRE - 2020
/////
///// LABORATORIO 06
///// EJERCIO 05


module ejercicio5();

  //variables 
  reg clk, reset;
  reg [3:0] q;
  wire [3:0] d;

  
  FFD4 U1(clk, reset, d, q);

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" FF d 4 bits ");
    $display("clk reset   d | q");
    $display("--------------|---");
    $monitor("%b %b %b | %b ", clk, reset, d, q);
  end

  initial begin
    assign d = {1, 0, 0, 1};
    clk = 0;
    reset =0;
    #10
    $finish;
  end

  always
    #5 clk1 = ~clk1;


  initial begin
    $dumpfile("ejercicio5_tb.vcd");
    $dumpvars(0, ejercicio5);
  end

endmodule
