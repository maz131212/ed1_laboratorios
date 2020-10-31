///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 30 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 03


// Flip Flop tipo D
module FFD(input wire clk, reset, enable, D, output reg Q);

  always @(posedge clk or posedge reset or posedge enable)
    begin
      if (reset) Q <= 1'b0;
      else if (enable) Q <= D;
      else Q <= Q;
    end

endmodule


// Flip Flop tipo J K
module FFJK(input wire clk, reset, enable, J, K, output wire Q);

  wire nQ, nK, a1, a2, D;

  // not (salida, entrada);
  // or (salida, entrada1, entrada2, entrada3, etc);
  // and (salida, entrada1, entrada2, entrada3, etc);
  not U1(nQ, Q);
  not U2(nK, K);

  and U3(a1, nQ, J);
  and U4(a2, Q, nK);
  
  or  U5(D, a1, a2);

  FFD U6(clk, reset, enable, D, Q);
  
  
endmodule
