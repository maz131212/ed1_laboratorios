///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 07 - NOVIEMBRE - 2020
/////
///// LABORATORIO 10
///// EJERCICIO 02


<<<<<<< HEAD





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
=======
/////////////////////////////////////////////////////////////////
///////////////////// ALU 
module ALU(
           input wire [3:0] A,
           input wire [3:0] B,
           input wire [2:0] fun,
           output reg [3:0] Y,
           output reg C,
           output reg Z
           );

  reg y = [4:0];
  
  always@(posedge fun)     
    begin

      y = 0;

      case(fun)
        0: y = A;
        1: y = A - B;
        2: y = B;
        3: y = A + B;
        4: y = ~(A | B);
        
        else y <= 0;
      endcase 
      
      C = y[4];
      
      Y[0] = y[0];
      Y[1] = y[1];
      Y[2] = y[2];
      Y[3] = y[3];
      
      if(y) Z = 0;
      else Z = 1;
      
    end
    
    
>>>>>>> 33c41d6804a7b201bbb0edd7fc78a35b89698879
endmodule




