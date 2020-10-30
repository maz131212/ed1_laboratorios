///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 29 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 01


// Flip Flop tipo D
module FFD(input wire clk, reset, enable, D, output reg Q);

  always @(posedge clk or posedge reset or posedge enable)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule


// Flip Flop tipo D de 2 bits
module FFD2(input wire clk, reset, enable, input wire [1:0] D, output wire [1:0] Q);

  FFD U1(clk, reset, enable, D[1], Q[1]);
  FFD U2(clk, reset, enable, D[0], Q[0]);

endmodule


// Flip Flop tipo D de 4 bits
module FFD4(input wire clk, reset, enable, input wire [3:0] D, output wire [3:0] Q);

  FFD U1(clk, reset, enable, D[3], Q[3]);
  FFD U2(clk, reset, enable, D[2], Q[2]);
  FFD U3(clk, reset, enable, D[1], Q[1]);
  FFD U4(clk, reset, enable, D[0], Q[0]);

endmodule

