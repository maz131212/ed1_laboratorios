///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 29 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 01


module ejercicio1();

  //para las pruebas se usara el mismo clock, reset y enable para todos los FF
  reg clk, reset, enable;

  wire q1;
  reg d1;

  wire [1:0] q2;
  reg [1:0] d2;

  wire [3:0] q4;
  reg [3:0] d4;

  
  FFD U1(clk, reset, enable, d1, q1);
  FFD2 U2(clk, reset, enable, d2, q2);
  FFD4 U4(clk, reset, enable, d4, q4);

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" FFD 4 bits ");
    $display("c r e d4 | q4");
    $display("--------------|---");
    $monitor("%b %b %b %b | %b ", clk, reset, enable, d4, q4);
  end

  initial begin
  
    d1 = 1'b1; 
    d2 = 2'b10; 
    d4 = 4'b1001; 

    clk = 0;
    reset = 1;
    enable = 0;
    #3

    reset = 0;
    enable = 1;
    #10

    enable = 0;
    #10

    d1 = 1'b0; 
    d2 = 2'b01; 
    d4 = 4'b0110; 
    enable = 1;
    #10

    enable = 0;
    #10

    reset = 1;
    #6



    $finish;
  end

  always
    #2 clk = ~clk;


  initial begin
    $dumpfile("ejercicio1_tb.vcd");
    $dumpvars(0, ejercicio1);
  end

endmodule
