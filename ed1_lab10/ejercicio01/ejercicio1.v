///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 06 - NOVIEMBRE - 2020
/////
///// LABORATORIO 10
///// EJERCICIO 01







//////////////////////////////////////////////////////////////////
///////////////////// EL MODULO 
module elmodulo(
                input wire clkPC,
                input wire resetPC,
                input wire enablePC,
                input wire loadPC,
                input wire [11:0] address,
                
                output wire [7:0] ProgramByte,
                
                input wire clkF, 
                input wire resetF, 
                input wire enableF, 
                
                output wire [3:0] Instr,
                output wire [3:0] Oprnd
                );

  wire [11:0] PC;

  PCounter U1 (clkPC, resetPC, enablePC, loadPC, address, PC);

  PROM U2 (PC, ProgramByte);

  FETCH U3 (clkF, resetF, enableF, ProgramByte, Instr, Oprnd);

endmodule
//////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////
///////////////////// PROGRAM COUNTER 
module PCounter(input wire clk,
                input wire reset,
                input wire enable,
                input wire load,
                input wire [11:0] D,
                output reg [11:0] Q);

  always @(posedge clk or posedge reset or posedge load)
    begin
      if (reset) Q <= 0;
      else if (load) Q <= D;
      else if (enable) Q <= Q+1;
      else Q <= Q;
    end
endmodule
//////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////
///////////////////// PROGRAM ROM
module PROM ( input wire [11:0] direccion,
              output wire [7:0] salida);
  

  reg [7:0] memoria1 [0:4095];

  initial begin
    $readmemb("memoria.list",memoria1);
  end

  assign salida = memoria1[direccion];

endmodule
//////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////
///////////////////// FETCH

// Flip Flop tipo D
module FFD(input wire clk,  
           input wire reset, 
           input wire enable, 
           input wire D, 
           output reg Q);

  always @(posedge clk or posedge reset or posedge enable)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule


// Flip Flop tipo D de 8 bits
module FFD8(input wire clk, 
             input wire reset, 
             input wire enable, 
             input wire [7:0] D, 
             output wire [7:0] Q);

  FFD U1(clk, reset, enable, D[7], Q[7]);
  FFD U2(clk, reset, enable, D[6], Q[6]);
  FFD U3(clk, reset, enable, D[5], Q[5]);
  FFD U4(clk, reset, enable, D[4], Q[4]);

  FFD U5(clk, reset, enable, D[3], Q[3]);
  FFD U6(clk, reset, enable, D[2], Q[2]);
  FFD U7(clk, reset, enable, D[1], Q[1]);
  FFD U8(clk, reset, enable, D[0], Q[0]);

endmodule


// Fetch
module FETCH(input wire clk, 
             input wire reset, 
             input wire enable, 
             input wire [7:0] D, 
             output wire [3:0] instruccion,
             output wire [3:0] operando);

  FFD U1(clk, reset, enable, D[7], instruccion[3]);
  FFD U2(clk, reset, enable, D[6], instruccion[2]);
  FFD U3(clk, reset, enable, D[5], instruccion[1]);
  FFD U4(clk, reset, enable, D[4], instruccion[0]);

  FFD U5(clk, reset, enable, D[3], operando[3]);
  FFD U6(clk, reset, enable, D[2], operando[2]);
  FFD U7(clk, reset, enable, D[1], operando[1]);
  FFD U8(clk, reset, enable, D[0], operando[0]);
  
endmodule
//////////////////////////////////////////////////////////////////
