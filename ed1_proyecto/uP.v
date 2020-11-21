///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 13 - NOVIEMBRE - 2020
/////
///// PROYECTO 02
///// PROCESADOR EN HDL




//////////////////////////////////////////////////////////////////
///////////////////// EL MODULO 
module uP(
          input wire clock,
          input wire reset,
          input wire [3:0] pushbuttons,

          output wire phase, 
          output wire c_flag, 
          output wire z_flag, 

          output wire [3:0] instr,
          output wire [3:0] oprnd,
          output wire [3:0] data_bus,
          output wire [3:0] FF_out,
          output wire [3:0] accu,
          
          output wire [7:0] program_byte,
          
          output wire [11:0] pc,
          output wire [11:0] address_ram
          );

  //señales de control provenientes del decode
  wire incPC, loadPC, loadA, loadFlags;
  wire [2:0] fun;
  wire csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut;
  
  //salidas de la ALU
  wire carry, zero;
  wire [3:0] alu;


  PCounter U1 (clock, reset, incPC, loadPC, address_ram, pc);

  PROM U2 (pc, program_byte);

  FETCH U3 (clock, reset, ~phase, program_byte, instr, oprnd);

  buffer bFetch (oeOprnd, oprnd, data_bus);

  buffer bALU (oeALU, alu, data_bus);

  buffer Inputs (oeIN, pushbuttons, data_bus);

  RAM U4 (csRAM, weRAM, oprnd, program_byte, data_bus);

  OUTPUTS U5 (clock, reset, loadOut, data_bus, FF_out);

  decode U6 (phase, z_flag, c_flag, instr,
             incPC, loadPC, loadA, loadFlags, fun,
             csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);
  
  ALU U7 (accu, data_bus, fun, carry, zero, alu);

  ACCUMULATOR U8 (clock, reset, loadA, alu, accu);

  FFT Phase (clock, reset, clock);

  FLAGS U9 (clock, reset, loadFlags, carry, zero,
            c_flag, z_flag );


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




//////////////////////////////////////////////////////////////////
///////////////////// BUFFER TRI-ESTADO
module buffer(input enabled, input [3:0] A, output [3:0] Y);
    
    assign Y = enabled ? A : 4'bz;
    
endmodule
//////////////////////////////////////////////////////////////////