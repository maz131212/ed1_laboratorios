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
    $display(" ");
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


  operadores2_1 OP5(p1, p2, p3, p4, led5);
  gateLevel2_2 GL6(p2, p3, led6);

  initial begin
    #35 $display(" ");
    $display(" Tabla 5 y 6");
    $display("A B C D | Y5 Y6");
    $display("--------|------");
    $monitor("%b %b %b %b | %b  %b", p1, p2, p3, p4, led5, led6);
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



  operadores2_3 OP7(p1, p2, p3, p4, led7);
  gateLevel2_4 GL8(p1, p2, p3, led8);

  initial begin
    #55 $display(" ");
    $display(" Tabla 7 y 8");
    $display("A B C D | Y7 Y8");
    $display("--------|------");
    $monitor("%b %b %b %b | %b  %b", p1, p2, p3, p4, led7, led8);
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
    #1 $display(" ");
    #1 $display(" ");

  end

  initial
    #75 $finish;


  initial begin
    $dumpfile("ed1_lab4_tb.vcd");
    $dumpvars(0, testbench);
  end

endmodule
