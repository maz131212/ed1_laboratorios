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
  gateLevel1_2 GL1(p2, led2);

  initial begin
    # 5 $display(" ");
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


  gateLevel1_3 GL3(p1, p2, p3, p4, led3);
  operadores1_4 OP4(p1, p2, p3, p4, led4);

  initial begin
    #15 $display(" ");
    $display(" Tabla 3 y 4");
    $display("A B C D | Y3 Y4");
    $display("--------|------");
    $monitor("%b %b %b %b | %b  %b", p1, p2, p3, p4, led3, led4);
       p1 = 0; p2 = 0; p3 = 0; p4 = 0;
    #1 p1 = 0; p2 = 0; p3 = 0; p4 = 1;
    #1 p1 = 0; p2 = 0; p3 = 1; p4 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1; p4 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0; p4 = 0;
    #1 p1 = 0; p2 = 1; p3 = 0; p4 = 1;
    #1 p1 = 0; p2 = 1; p3 = 1; p4 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1; p4 = 1;
    #1 p1 = 1; p2 = 0; p3 = 0; p4 = 0;
    #1 p1 = 1; p2 = 0; p3 = 0; p4 = 1;
    #1 p1 = 1; p2 = 0; p3 = 1; p4 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1; p4 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0; p4 = 0;
    #1 p1 = 1; p2 = 1; p3 = 0; p4 = 1;
    #1 p1 = 1; p2 = 1; p3 = 1; p4 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1; p4 = 1;

  end


  initial
    #35 $finish;


  initial begin
    $dumpfile("ed1_lab4_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
