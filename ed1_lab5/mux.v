///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 15 - AGOSTO - 2020
/////
///// LABORATORIO 05
///// EJERCIO 04




// mux 2:1 simple
module mux21(input wire S, D0, D1, output wire Y);

  assign Y = S ? D1 : D0;

endmodule


// mux 4:1 simple
module mux41(input wire S0, S1, D0, D1, D2, D3, output wire Y);

  wire Y1, Y2;

  mux21 U1(S0, D0, D1, Y1);

  mux21 U2(S0, D2, D3, Y2);

  mux21 U3(S1, Y1, Y2, Y);

endmodule


// mux 8:1 simple
module mux81(input wire S0, S1, S2, D0, D1, D2, D3, D4, D5, D6, D7, output wire Y);

  wire Y1, Y2;

  mux41 U1(S0, S1, D0, D1, D2, D3, Y1);

  mux41 U2(S0, S1, D4, D5, D6, D7, Y2);

  mux21 U3(S2, Y1, Y2, Y);

endmodule
