///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 05 - SEPTIEMBRE - 2020
/////
///// LABORATORIO 06
///// EJERCIO 05


// Flip Flop tipo D
module FFD(input wire clk, reset, D, output reg Q);

  always @(posedge clk or posedge reset)
    begin
      if (reset)
        Q <= 1'b0;
      else
        Q <= D;
    end
endmodule

// Flip Flop 4 bits
module FFD4(input wire clk, reset, input wire [3:0] D, output reg [3:0] Q);


  FFD U1(clk, reset, D[3], Q[3]);
  FFD U2(clk, reset, D[2], Q[2]);
  FFD U3(clk, reset, D[1], Q[1]);
  FFD U4(clk, reset, D[0], Q[0]);


endmodule

