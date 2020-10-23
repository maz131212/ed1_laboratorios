///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 23 - OCTUBRE - 2020
/////
///// LABORATORIO 08
///// EJERCICIO 01


module ejercicio1();

  //variables 
  reg clk, reset, enabled, load;
  wire [11:0] q;
  reg [11:0] d;


  contador U1(clk, reset, enabled, load, d, q);
  

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" Contador ");
    $display("c r e l | q");
    $display("--------|---");
    $monitor("%b %b %b %b | %b ", clk, reset, enabled, load, q);
  
    d = 12'b000110100010; //418 será el valor precargado
    
    //reset (para iniciar en 0)
    clk=0; reset = 1; enabled = 0; load = 0;
    #2

    //no contar
    reset = 0; enabled = 0; load = 0;
    #10

    //contar
    reset = 0; enabled = 1; load = 0;
    #20

    //no contar
    reset = 0; enabled = 0; load = 0;
    #10

    //cargar
    reset = 0; enabled = 0; load = 1;
    #20
  
    //contar despues de cargar
    reset = 0; enabled = 1; load = 0;
    #14

    //reset (para iniciar en 0)
    clk=0; reset = 1; enabled = 1; load = 0;
    #2

    //contar
    reset = 0; enabled = 1; load = 0;
    


  end


  initial 
   #95 $finish;


  always
    #2 clk = ~clk;


  initial begin
    $dumpfile("ejercicio1_tb.vcd");
    $dumpvars(0, ejercicio1);
  end

endmodule
