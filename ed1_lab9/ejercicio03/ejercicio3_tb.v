///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 30 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 03


module ejercicio3();

  //para las pruebas se usara el mismo clock, reset y enable para todos los FF
  reg clk, reset, enable;
  reg j, k;
  wire q;


  FFJK U1(clk, reset, enable, j, k, q);

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" FFJK ");
    $display("c r e j k | q");
    $display("----------|---");
    $monitor("%b %b %b %b %b | %b ", clk, reset, enable, j, k, q);
  end

  initial begin
  
    j = 0;
    k = 0;
    

    clk = 0;
    reset = 1;
    enable = 0;
    #3

//
    j = 1;
    k = 0;

    reset = 0;
    enable = 1;
    #10

    //enable = 0;
    #10

//

    j = 0;
    k = 0;

    enable = 1;
    #10

    //enable = 0;
    #10


//

    j = 0;
    k = 1;

    enable = 1;
    #10

    //enable = 0;
    #10

//


//

    j = 1;
    k = 1;

    enable = 1;
    #30

    enable = 0;
    #10

//





    reset = 1;
    #6



    $finish;
  end

  always
    #2 clk = ~clk;


  initial begin
    $dumpfile("ejercicio3_tb.vcd");
    $dumpvars(0, ejercicio3);
  end

endmodule
