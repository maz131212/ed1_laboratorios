///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 15 - AGOSTO - 2020
/////
///// LABORATORIO 05
///// EJERCIO 04



module mux();

  reg s0, s1, s2; //selectores
  reg d0, d1, d2, d3, d4, d5, d6, d7, d8; //datos de prueba
  wire prueba1, prueba2, prueba3; //pruebas de los modulos mux
  wire led1, led2, led3, led4, led5, led6; //resultados de las tablas "Y"


  //PROBANDO EL MUX 2:1 SIMPLE
  mux21 mux2simple(s0, d0, d1, prueba1);
  
  initial begin
    # 5 $display(" ");
    $display(" ");
    $display("mux2:1 simple ");
    $display("S D0 D1 | Y");
    $display("--------|---");
    $monitor("%b  %b  %b | %b", s0, d0, d1, prueba1);
       s0 = 0; d0 = 0; d1 = 0;
    #1 s0 = 0; d0 = 0; d1 = 1;
    #1 s0 = 0; d0 = 1; d1 = 0;
    #1 s0 = 0; d0 = 1; d1 = 1;
    #1 s0 = 1; d0 = 0; d1 = 0;
    #1 s0 = 1; d0 = 0; d1 = 1;
    #1 s0 = 1; d0 = 1; d1 = 0;
    #1 s0 = 1; d0 = 1; d1 = 1;
  end


  //PROBANDO EL MUX 4:1 SIMPLE
  mux41 mux4simple(s0, s1, d0, d1, d2, d3, prueba2);

    
   initial begin
    # 15 $display(" ");
    $display(" ");
    $display("prueba mux 4:1 ");
    $display("A B | Y");
    $display("----|---");
    $monitor("%b %b | %b", s1, s0, prueba2);
       d0 = 0; d1 = 1; d2 = 1; d3 = 0;
       s1 = 0; s0 = 0; 
    #1 s1 = 0; s0 = 1; 
    #1 s1 = 1; s0 = 0; 
    #1 s1 = 1; s0 = 1; 
    
  end

  mux81 mux8simple(s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7, prueba3);

   initial begin
    # 25 $display(" ");
    $display(" ");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, prueba3);
       d4 = 1; d5 = 0; d6 = 0; d7 = 1;
       s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;

  end
    
  /*
   initial begin
    # 10 $display(" ");
    $display(" ");
    $display("S A B | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", p1, p2, p3, led1);
       p1 = 0; p2 = 0; p3 = 0;
    #1 p1 = 0; p2 = 0; p3 = 1;
    #1 p1 = 0; p2 = 1; p3 = 0;
    #1 p1 = 0; p2 = 1; p3 = 1;
    #1 p1 = 1; p2 = 0; p3 = 0;
    #1 p1 = 1; p2 = 0; p3 = 1;
    #1 p1 = 1; p2 = 1; p3 = 0;
    #1 p1 = 1; p2 = 1; p3 = 1;
  end
  */

  initial
    #35 $finish;

  /*
  initial begin
    //$dumpfile("mux_tb.vcd");
    //$dumpvars(0, mux);
  end
  */

endmodule
