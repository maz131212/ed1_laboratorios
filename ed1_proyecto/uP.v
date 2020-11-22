//-----------------------------------------------------
// ELECTRÓNICA DIGITAL 1
// AXEL MAZARIEGOS - 131212
// 13 - NOVIEMBRE - 2020
//
// PROYECTO 02
// PROCESADOR EN HDL
//-----------------------------------------------------
//-----------------------------------------------------
//
// El proyecto está dividido en varios archivos, el principal es este.
//
// ALU.v - ALU
// decode.v - Decode
// FF.v - (flip flops) Phase, Flags, Fetch, Outputs, Accumulator 
// RAM.v - RAM
// uP.v - uP, Program counter, ROM, Buffer Tri-estado
//
//-----------------------------------------------------


//////////////////////////////////////////////////////////////////
///////////////////// EL MODULO 
// Este es el modulo que une todos los componentes del procesador

module uP(
          input wire clock,               // Se utilizará la misma señal del clock para el PC y todos los FF
          input wire reset,               // Se utilizará la misma señal del reset para el PC y todos los FF
          input wire [3:0] pushbuttons,   // Las entradas del procesador

          output wire phase,              // Una señal importante utilizada para ejecutar funciones
          output wire c_flag,             // Carry de la ALU 
          output wire z_flag,             // Z de la ALU

          output wire [3:0] instr,        // Instruccion proveniente de la ROM para el decode
          output wire [3:0] oprnd,        // Operando proveniente de la ROM para el data bus
          output wire [3:0] data_bus,     // Varias señales (solo se usa una a la vez)
          output wire [3:0] FF_out,       // Salidas del procesador
          output wire [3:0] accu,         // Señal del acumulador
          
          output wire [7:0] program_byte, // Señal proveniente de la ROM
          
          output wire [11:0] PC,          // Program counter 
          output wire [11:0] address_RAM  // Dirección de la RAM
          );

  //señales de control provenientes del decode
  wire incPC, loadPC, loadA, loadFlags;
  wire [2:0] fun;
  wire csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut;
  
  //salidas de la ALU
  wire carry, zero;
  wire [3:0] alu;

  // En el procesador hay muchas señales de varios modulos, cada una se explicará en su modulo

  PCounter U1 (clock, reset, incPC, loadPC, address_RAM, PC);

  PROM U2 (PC, program_byte);

  FETCH U3 (clock, reset, ~phase, program_byte, instr, oprnd);

  buffer bFetch (oeOprnd, oprnd, data_bus);

  buffer bALU (oeALU, alu, data_bus);

  buffer Inputs (oeIN, pushbuttons, data_bus);

  RAM U4 (csRAM, weRAM, oprnd, program_byte, data_bus, address_RAM);

  OUTPUTS U5 (clock, reset, loadOut, data_bus, FF_out);

  decode U6 (phase, z_flag, c_flag, instr,
             incPC, loadPC, loadA, loadFlags, fun,
             csRAM, weRAM, oeALU, oeIN, oeOprnd, loadOut);
  
  ALU U7 (accu, data_bus, fun, carry, zero, alu);

  ACCUMULATOR U8 (clock, reset, loadA, alu, accu);

  FFT Phase (clock, reset, phase);

  FLAGS U9 (clock, reset, loadFlags, carry, zero,
            c_flag, z_flag );


endmodule
//////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////
///////////////////// PROGRAM COUNTER 
module PCounter(input wire clk,       // Se utilizará la misma señal del clock para el PC y todos los FF
                input wire reset,     // Se utilizará la misma señal del reset para el PC y todos los FF
                input wire enable,    // El enable proviene de las señales de control del DECODE
                input wire load,      // El load proviene de las señales de control del DECODE
                input wire [11:0] D,  // Este será el address_RAM
                output reg [11:0] Q); // Señal de salida del program counter

  // Este es un contador sincrono de 12 bits con enable y load
  always @(posedge clk or posedge reset)
    begin
      if (reset) Q <= 12'b0;      // Si se reinicia el contador estará en 0 
      else if (load) Q <= D;      // Si load está activado se cargará el valor de la address_RAM
      else if (enable) Q <= Q+1;  // Si el enable está activado se contará
      // else Q <= Q;
    end
endmodule
//////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
///////////////////// PROGRAM ROM
module PROM ( input wire [11:0] direccion,  // Señal proveniente del Program Counter (dirección de la memoria)
              output wire [7:0] salida);    // program_byte (salida de la memoria)
  

  reg [7:0] memoria1 [0:4095];  // Declaramos la memoria        

  // COMENTARIO IMPORTANTE PARA EL FUNCIONAMIENTO
  // Para probar el testbench que envió Kurt se debe usar "memory.list"
  // Para probar mi testbench se debe usar "memoria.list"

  initial begin
    $readmemh("memory.list",memoria1);  // Para leer la memoria 
  end

  assign salida = memoria1[direccion];  // Asignamos el valor de salida segun la dirección

endmodule
//////////////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////
///////////////////// BUFFER TRI-ESTADO
module buffer(input enabled, input [3:0] A, output [3:0] Y);
    
    assign Y = enabled ? A : 4'bz; 

    // Si enable es 1 deja pasar el valor de la entrada
    // De lo contrario estará en alta impedancia
    
endmodule
//////////////////////////////////////////////////////////////////