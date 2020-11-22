//-----------------------------------------------------
// ELECTRÓNICA DIGITAL 1
// AXEL MAZARIEGOS - 131212
// 19 - NOVIEMBRE - 2020
//
// PROYECTO 02
// PROCESADOR EN HDL
// FLIP FLOPS
//-----------------------------------------------------
//-----------------------------------------------------


//////////////////////////////////////////////////////////////////
///////////////////// FLIP FLOP TIPO D (sincrono con enable)
module FFD(input wire clk,    // clock 
           input wire reset,  // reset
           input wire enable, // enable (para que cargue el valor de D en Q)
           input wire D,      // entrada
           output reg Q);     // salida

  always @(posedge clk or posedge reset) //depende de la señal de reloj o reset
    begin
      if (reset) Q <= 1'b0;     // Si se reinicia el contador estará en 0 
      else if (enable) Q <= D;  // Sí el enable es 1 se carga el valor de D en Q
      //else Q <= Q;              
    end

endmodule
//////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
///////////////////// FLAGS 
// (Flip Flop tipo D de 2 bits, con 2 entradas y 2 salidas)
module FLAGS(input wire clk,      // Se utilizará la misma señal del clock para el PC y todos los FF
             input wire reset,    // Se utilizará la misma señal del reset para el PC y todos los FF
             input wire enable,   // El enable proviene de las señales de control del DECODE
             input wire carry,    // Carry (proviene de la ALU)
             input wire zero,     // Zero (proviene de la ALU)
             output wire c_flag,  // salida para el DECODE
             output wire z_flag); // salida para el DECODE

  FFD U1(clk, reset, enable, carry, c_flag);
  FFD U2(clk, reset, enable, zero, z_flag);

endmodule
//////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
///////////////////// ACCUMULATOR 
// (Flip Flop tipo D de 4 bits)
module ACCUMULATOR(input wire clk,        // Se utilizará la misma señal del clock para el PC y todos los FF
                   input wire reset,      // Se utilizará la misma señal del reset para el PC y todos los FF
                   input wire enable,     // El enable (loadA) proviene de las señales de control del DECODE
                   input wire [3:0] D,    // Entrada - alu (proviene de la ALU)
                   output wire [3:0] Q);  // Salida - accu (hacia la ALU)

  FFD U1(clk, reset, enable, D[3], Q[3]);
  FFD U2(clk, reset, enable, D[2], Q[2]);
  FFD U3(clk, reset, enable, D[1], Q[1]);
  FFD U4(clk, reset, enable, D[0], Q[0]);

endmodule
//////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
///////////////////// OUTPUTS 
// (Flip Flop tipo D de 4 bits)
module OUTPUTS( input wire clk,       // Se utilizará la misma señal del clock para el PC y todos los FF
                input wire reset,     // Se utilizará la misma señal del reset para el PC y todos los FF
                input wire enable,    // El enable (loadOut) proviene de las señales de control del DECODE
                input wire [3:0] D,   // Entrada - data_bus 
                output wire [3:0] Q); // Salida - FF_out 

  FFD U1(clk, reset, enable, D[3], Q[3]);
  FFD U2(clk, reset, enable, D[2], Q[2]);
  FFD U3(clk, reset, enable, D[1], Q[1]);
  FFD U4(clk, reset, enable, D[0], Q[0]);

endmodule
//////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
///////////////////// FETCH 
// (Flip Flop tipo D de 8 bits con dos salidas de 4 bits)
module FETCH(input wire clk,                // Se utilizará la misma señal del clock para el PC y todos los FF
             input wire reset,              // Se utilizará la misma señal del reset para el PC y todos los FF
             input wire enable,             // Enable (~Phase) 
             input wire [7:0] D,            // Entrada - program_byte (señal de la ROM)
             output wire [3:0] instruccion, // salida instr, para el DECODE 
             output wire [3:0] operando);   // salida oprnd

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



//////////////////////////////////////////////////////////////////
///////////////////// FLIP FLOP TIPO D (sincrono sin enable) 
module FFDNE(input wire clk, reset, D, output reg Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset)
        Q <= 1'b0;  // Si se reinicia el contador estará en 0 
      else
        Q <= D;     // De lo contrario se carga D en Q
    end
endmodule
//////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////
///////////////////// PHASE
// (Flip Flop tipo T en base de un FFD sin enable)
module FFT (input wire clk,   // Se utilizará la misma señal del clock para el PC y todos los FF
            input wire reset, // Se utilizará la misma señal del reset para el PC y todos los FF
            output wire Q);   // Salida - Phase
    
    FFDNE U1(clk, reset, ~Q, Q);
    
endmodule
//////////////////////////////////////////////////////////////////