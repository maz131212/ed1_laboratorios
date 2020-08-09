///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 09 - AGOSTO - 2020
/////
///// LABORATORIO 04
///// EJERCIO 05



module alarma();

  reg p1, p2, p3;
  wire led1, led2, led3, led4, led5, led6;

  SOP_gateLevel SOPg(p1, p2, p3, led1);
  SOP_operadores SOPo(p1, p2, p3, led2);

  initial begin
    # 5 $display(" ");
    $display(" ");
    $display("     SOP     ");
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


  POS_gateLevel POSg(p1, p2, p3, led3);
  POS_operadores POSo(p1, p2, p3, led4);

  initial begin
    #15 $display(" ");
    $display(" ");
    $display("     POS     ");
    $display("A B C | Y3 Y4");
    $display("------|------");
    $monitor("%b %b %b | %b  %b", p1, p2, p3, led3, led4);
       p1 = 0; p2 = 0; p3 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1;
    #1 p1 = 1; p2 = 0; p3 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1;
  end


  ES_gateLevel ESg(p1, p2, p3, led5);
  ES_operadores ESo(p1, p2, p3, led6);

  initial begin
    #25 $display(" ");
    $display(" ");
    $display("e. simplificada");
    $display("A B C | Y5 Y6");
    $display("------|------");
    $monitor("%b %b %b | %b  %b", p1, p2, p3, led5, led6);
       p1 = 0; p2 = 0; p3 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1;
    #1 p1 = 1; p2 = 0; p3 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1;
    #1 $display(" ");
    #1 $display(" ");
  end

  initial
    #35 $finish;


  initial begin
    $dumpfile("alarma_tb.vcd");
    $dumpvars(0, alarma);
  end

endmodule
