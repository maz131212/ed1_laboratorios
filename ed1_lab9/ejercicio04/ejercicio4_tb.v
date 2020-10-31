///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 30 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 04


module ejercicio4();

  //para las pruebas se usara el mismo clock, reset y enable para todos los FF
  
  reg [3:0] a;
  reg enable;
  wire [3:0] y;
  
  
  triestado U1(a, enable, y);

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" Buffer Tri-Estado ");
    $display("a    e |  y");
    $display("-------|-----");
    $monitor("%b %b | %b ", a, enable, y);
  end

  initial begin

    //prueba 1
    a = 4'b1010; 
    enable = 1;
    #10

    enable = 0; 
    #10

    enable = 1;
    #10

    enable = 0; 
    #10

    //prueba 2
    a = 4'b0110; 
    enable = 1;
    #10

    enable = 0; 
    #10

    enable = 1;
    #10

    enable = 0; 
    #10


    $finish;
  end


  initial begin
    $dumpfile("ejercicio4_tb.vcd");
    $dumpvars(0, ejercicio4);
  end

endmodule
