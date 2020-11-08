///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 07 - NOVIEMBRE - 2020
/////
///// LABORATORIO 10
///// EJERCICIO 02


//////////////////////////////////////////////////////////////////
///////////////////// EL CIRCUITO 
module elcircuito(
                  input wire [3:0] Operand,
                  input wire enable1,
                  //output wire [3:0] DataBus1,

                  input wire clkA, 
                  input wire resetA, 
                  input wire enableA,
                  //output wire [3:0] accu,

                  input wire [2:0] funCODE,
                  //output wire [3:0] ALUResult, 
                  output wire Carry,
                  output wire Zero,

                  input wire enable2,
                  output wire [3:0] DataBus2
                  );

  wire [3:0] DataBus1;
  wire [3:0] accu;
  wire [3:0] ALUResult;


  triestado Bus1 (Operand, enable1, DataBus1);

  ALU miALU (accu, DataBus1, funCODE, ALUResult, Carry, Zero);

  FFD44 Accumulator (clkA, resetA, enableA, ALUResult, accu);

  triestado Bus2 (ALUResult, enable2, DataBus2);
  

endmodule
//////////////////////////////////////////////////////////////////





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

  reg [4:0] y;
  
  always@(posedge fun)     
    begin

      y = 0;

      case(fun)
        0: y = A;
        1: y = A - B;
        2: y = B;
        3: y = A + B;
        4: y = ~(A | B);
        

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
/////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
///////////////////// ACCUMULATOR

// Flip Flop tipo D
module FFD(input wire clk,  
           input wire reset, 
           input wire enable, 
           input wire D, 
           output reg Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule


// Flip Flop tipo D de 4 bits
module FFD44(input wire clk, 
             input wire reset, 
             input wire enable, 
             input wire [3:0] D, 
             output wire [3:0] Q);

  FFD U1(clk, reset, enable, D[3], Q[3]);
  FFD U2(clk, reset, enable, D[2], Q[2]);
  FFD U3(clk, reset, enable, D[1], Q[1]);
  FFD U4(clk, reset, enable, D[0], Q[0]);

endmodule
/////////////////////////////////////////////////////////////////





/////////////////////////////////////////////////////////////////
///////////////////// BUS DRIVER

// Buffer Tri-estado
module triestado(input  [3:0] A,
                 input  EN,
                 output  [3:0] Y);

  assign Y = EN ? A : 4'bZZZZ;

endmodule
/////////////////////////////////////////////////////////////////

