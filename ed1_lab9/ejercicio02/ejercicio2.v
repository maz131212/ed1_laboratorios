///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 30 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 02


// Flip Flop tipo D
module FFD(input wire clk, reset, enable, D, output reg Q);

  always @(posedge clk or posedge reset or posedge enable)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule


// Flip Flop tipo T
module FFT(input wire clk, reset, enable, output wire T);

  wire cable;
  not U1(cable, T);
  
  FFD U2(clk, reset, enable, cable, T);


endmodule


/* //Este flip flip devulve el negado de la entrada
//no es necesario para el laboratorio 
module FFX(input wire clk, reset, enable, D, Q, output reg N);

  FFD U1(clk, reset, enable, D, Q);


  always @(posedge clk or posedge reset or enable)
    begin
      if (reset)  N <= 1'b0;
      else if (enable) N <= ~D;
      else  N <= ~Q;
    end

endmodule
*/