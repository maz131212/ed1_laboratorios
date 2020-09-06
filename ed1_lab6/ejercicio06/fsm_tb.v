///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 05 - SEPTIEMBRE - 2020
/////
///// LABORATORIO 06
///// EJERCIO 06


module fsm();

  //variables para el ejercicio 01
  reg clk1, reset1, A, B;
  wire Y;
  wire [1:0] Se1futuro, Se1presente;

  //variables para el ejercicio 03
  reg clk3, reset3, A3;
  wire [2:0] Y3, Se3futuro, Se3presente;


  ejercicio01 U1(A, B, clk1, reset1, Y, Se1presente, Se1futuro);

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" Ejercicio 01 ");
    $display("clk reset A B Sf S | Y");
    $display("-------------------|---");
    $monitor("%b %b %b %b %b %b | %b ", clk1, reset1, A, B, Se1futuro, Se1presente, Y);
  end

  initial begin
    clk1 = 0;
    reset1 =0;
    A = 0;
    B = 0;
    #1 reset1 = 1;
    #1 reset1 = 0;
    #20
    A = 1;
    B = 0;
    #40
    A = 1;
    B = 1;
    #40
    A = 0;
    B = 1;
    #40
    A = 0;
    B = 0;
    #40
    A = 1;
    B = 1;
    #40
    $finish;
  end

  always
    #5 clk1 = ~clk1;



  ejercicio03 U3(A3, clk3, reset3, Y3, Se3presente, Se3futuro);


  initial begin
    clk3 = 0;
    reset3 =0;
    A3 = 0;
    
    #1 reset3 = 1;
    #1 reset3 = 0;
    #10
    A3 = 1;
    #100
    A3 = 0;
  end

  always
    #10 clk3 = ~clk3;


  initial begin
    $dumpfile("fsm_tb.vcd");
    $dumpvars(0, fsm);
  end

endmodule
