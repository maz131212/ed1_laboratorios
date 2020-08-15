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
       d0 = 0; d1 = 1; d2 = 0; d3 = 1;
       s1 = 0; s0 = 0; 
    #1 s1 = 0; s0 = 1; 
    #1 s1 = 1; s0 = 0; 
    #1 s1 = 1; s0 = 1; 
    
  end

  //PROBANDO EL MUX 8:1 SIMPLE
  mux81 mux8simple(s0, s1, s2, d0, d1, d2, d3, d4, d5, d6, d7, prueba3);

   initial begin
    # 25 $display(" ");
    $display(" ");
    $display("prueba mux 8:1 ");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, prueba3);
       d4 = 0; d5 = 0; d6 = 1; d7 = 1;
       s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;

  end



  //MUX 8:1 DE LA TABLA 1
  t1mux81 t1mux8(s2, s1, s0, led1);

  initial begin
    # 35 $display(" ");
    $display(" ");
    $display("Tabla 01 mux8:1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, led1);
       s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;

  end

  //MUX 4:1 DE LA TABLA 1
  t1mux41 t1mux4(s2, s1, s0, led2);

  initial begin
    # 45 $display(" ");
    $display(" ");
    $display("Tabla 01 mux4:1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, led2);
        s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;
    
  end

  //MUX 2:1 DE LA TABLA 1
  t1mux21 t1mux2(s2, s1, s0, led3);

  initial begin
    # 55 $display(" ");
    $display(" ");
    $display("Tabla 01 mux2:1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, led3);
        s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;
    
  end
  
  


  //MUX 8:1 DE LA TABLA 2
  t2mux81 t2mux8(s2, s1, s0, led4);

  initial begin
    # 65 $display(" ");
    $display(" ");
    $display("Tabla 02 mux8:1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, led4);
       s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;

  end

  //MUX 4:1 DE LA TABLA 2
  t2mux41 t2mux4(s2, s1, s0, led5);

  initial begin
    # 75 $display(" ");
    $display(" ");
    $display("Tabla 02 mux4:1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, led5);
        s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;
    
  end

  //MUX 2:1 DE LA TABLA 2
  t2mux21 t2mux2(s2, s1, s0, led6);

  initial begin
    # 85 $display(" ");
    $display(" ");
    $display("Tabla 02 mux2:1");
    $display("A B C | Y");
    $display("------|---");
    $monitor("%b %b %b | %b", s2, s1, s0, led6);
        s2 = 0; s1 = 0; s0 = 0;
    #1 s2 = 0; s1 = 0; s0 = 1;
    #1 s2 = 0; s1 = 1; s0 = 0;
    #1 s2 = 0; s1 = 1; s0 = 1;
    #1 s2 = 1; s1 = 0; s0 = 0;
    #1 s2 = 1; s1 = 0; s0 = 1;
    #1 s2 = 1; s1 = 1; s0 = 0;
    #1 s2 = 1; s1 = 1; s0 = 1;
    
  end
 

  initial
    #95 $finish;

  /*
  initial begin
    //$dumpfile("mux_tb.vcd");
    //$dumpvars(0, mux);
  end
  */

endmodule
