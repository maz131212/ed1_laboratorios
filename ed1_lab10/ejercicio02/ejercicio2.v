///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 07 - NOVIEMBRE - 2020
/////
///// LABORATORIO 10
///// EJERCICIO 02


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
    
    
endmodule




