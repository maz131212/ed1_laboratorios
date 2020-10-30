///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 30 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 02


module ejercicio2();

  //para las pruebas se usara el mismo clock, reset y enable para todos los FF
  reg clk, reset, enable;

  wire q;
 
  
  FFT U2(clk, reset, enable, q);
  

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" FFD y FFT ");
    $display("c r e | q");
    $display("------|----");
    $monitor("%b %b %b | %b ", clk, reset, enable, q,);
  end

  initial begin
   
    clk = 0;
    reset = 1;
    enable = 0;
    #10

    reset = 0;
    enable = 1;
    #30

    enable = 0;
    #10

   
    enable = 1;
    #25

    enable = 0;
    #10

    reset = 1;
    #6



    $finish;
  end

  always
    #2 clk = ~clk;


  initial begin
    $dumpfile("ejercicio2_tb.vcd");
    $dumpvars(0, ejercicio2);
  end

endmodule
