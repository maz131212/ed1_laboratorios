///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 23 - OCTUBRE - 2020
/////
///// LABORATORIO 08
///// EJERCICIO 01



// Contador Especial
module contador(input wire clk,
                input wire reset,
                input wire enabled,
                input wire load,
                input wire [11:0] D,
                output reg [11:0] Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset) Q <= 0;
      else if (load) Q <= D;
      else if (enabled) Q <= Q+1;
      else Q <= Q;
    end
endmodule


