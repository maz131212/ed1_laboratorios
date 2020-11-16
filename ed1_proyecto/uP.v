///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 13 - NOVIEMBRE - 2020
/////
///// PROYECTO 02
///// PROCESADOR EN HDL




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
      if (reset) Q <= 12'b0;
      else if (load) Q <= D;
      else if (enable) Q <= Q+1;
      //else Q <= Q;
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





