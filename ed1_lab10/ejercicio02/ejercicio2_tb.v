///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 23 - OCTUBRE - 2020
/////
///// LABORATORIO 08
///// EJERCICIO 03

module ejercicio3();

  //variables 
  reg [2:0] F;
  reg [11:0] A;
  reg [11:0] B;
  wire [11:0] Y;


  alu U1(A, B, F, Y);
  

  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" Contador ");
    $display("F A B | Y");
    $display("--------|---");
    $monitor("%b %b %b | %b ", F, A, B, Y);
  
    A = 12'b000110100010; //418 será el valor 
    B = 12'b001000000000; //512 será el valor 

    //reset (para iniciar en 0)
    #10 F = 0;
    #10 F = 1;
    #10 F = 2;
    #10 F = 3;
    #10 F = 4;
    #10 F = 5;
    #10 F = 6;
    #10 F = 7;
    #10  $finish;
  end


  initial begin
    $dumpfile("ejercicio3_tb.vcd");
    $dumpvars(0, ejercicio3);
  end

endmodule
