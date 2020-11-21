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


// Flip Flop tipo D (sincrono)
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



// Flags (Flip Flop tipo D de 2 bits, con 2 entradas y 2 salidas)
module FLAGS(input wire clk, 
             input wire reset, 
             input wire enable, 
             input wire carry,
             input wire zero,
             output wire c_flag,  
             output wire z_flag);

  FFD U1(clk, reset, enable, carry, c_flag);
  FFD U2(clk, reset, enable, zero, z_flag);

endmodule



// Accumulator (Flip Flop tipo D de 4 bits)
module ACCUMULATOR(input wire clk, 
                   input wire reset, 
                   input wire enable, 
                   input wire [3:0] D, 
                   output wire [3:0] Q);

  FFD U1(clk, reset, enable, D[3], Q[3]);
  FFD U2(clk, reset, enable, D[2], Q[2]);
  FFD U3(clk, reset, enable, D[1], Q[1]);
  FFD U4(clk, reset, enable, D[0], Q[0]);

endmodule


// Outputs (Flip Flop tipo D de 4 bits)
module OUTPUTS( input wire clk, 
                input wire reset, 
                input wire enable, 
                input wire [3:0] D, 
                output wire [3:0] Q);

  FFD U1(clk, reset, enable, D[3], Q[3]);
  FFD U2(clk, reset, enable, D[2], Q[2]);
  FFD U3(clk, reset, enable, D[1], Q[1]);
  FFD U4(clk, reset, enable, D[0], Q[0]);

endmodule





// Fetch (Flip Flop tipo D de 8 bits con dos salidas de 4 bits)
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



// Flip Flop tipo D sin enable
module FFDNE(input wire clk, reset, D, output reg Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset)
        Q <= 1'b0;
      else
        Q <= D;
    end
endmodule



// Phase (Flip Flop tipo T en base de un FFD sin enable)
module FFT (input wire clk,
            input wire reset, 
            output wire Q);
    
    FFDNE U1(clk, reset, ~Q, Q);
    
endmodule
