///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 07 - NOVIEMBRE - 2020
/////
///// LABORATORIO 10
///// EJERCICIO 02







//////////////////////////////////////////////////////////////////
///////////////////// ALU



module ALU(input wire [3:0] A,
           input wire [3:0] B,
           input wire [2:0] FUN,
           output reg [4:0] Y,
           output reg [4:0] C.
           output reg [4:0] Z);

  reg [4:0] y;  

  always@(posedge FUN)     
    begin

      y = 4'b0000;

      case(fun)
        3'b000: y = A;
        3'b001: y = A - B;
        3'b010: y = B;
        3'b011: y = A + B;
        3'b100: y = ~(A | B);
           else y <= 0;
      endcase 

      


    end
endmodule




