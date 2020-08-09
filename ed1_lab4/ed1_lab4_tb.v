///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 09 - AGOSTO - 2020
/////
///// LABORATORIO 04
///// EJERCIO 04



module testbench();

  reg p1, p2, p3, p4;
  wire led1, led2, led3, led4, led5, led6, led7, led8;

  operadores1_1 OP1(p1, p2, p3, led1);
  gateLevel1_2 GL1(p1, p2, p3, led2);


  initial begin
    $display(" Tabla 1 y 2");
    $display("A B C | Y1 Y2");
    $display("------|------");
    $monitor("%b %b %b | %b  %b", p1, p2, p3, led1, led2);
       p1 = 0; p2 = 0; p3 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1;
    #1 p1 = 1; p2 = 0; p3 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1;
  end

  initial begin
    #9
    $display("\n");
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", p4, p5, p6, led2);
       p4 = 0; p5 = 0; p6 = 0;
    #1 p4 = 0; p5 = 0; p6 = 1;
    #1 p4 = 0; p5 = 1; p6 = 0;
    #1 p4 = 0; p5 = 1; p6 = 1;
    #1 p4 = 1; p5 = 0; p6 = 0;
    #1 p4 = 1; p5 = 0; p6 = 1;
    #1 p4 = 1; p5 = 1; p6 = 0;
    #1 p4 = 1; p5 = 1; p6 = 1;
  end

  initial
    #20 $finish;

  initial begin
    $dumpfile("codigo_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
