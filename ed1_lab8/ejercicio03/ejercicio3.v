///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 23 - OCTUBRE - 2020
/////
///// LABORATORIO 08
///// EJERCICIO 03




module alu(input wire [11:0] a,
           input wire [11:0] b,
           input wire [2:0] fun,
           output reg [11:0] y);

  

  always@(posedge fun or posedge a or posedge b)     
    begin

      y = 0;

      case(fun)
        0: y = a & b;
        1: y = a | b;
        2: y = a + b;
        3: y = 0;
        4: y = a & ~b;
        5: y = a | ~b;
        6: y = a - b;
        7: if (a < b) y <= 12'b111111111111;
           else y <= 0;
      endcase 
    end
endmodule




