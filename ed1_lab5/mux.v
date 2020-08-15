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




// mux 8:1 Tabla 01 Ejercicio 01
module t1mux81(input wire A, B, C, output wire Y);

  wire VCC, GND;

  assign VCC = 1;
  assign GND = 0;

  mux81 U1(C, B, A, GND, VCC, VCC, GND, VCC, GND, GND, VCC, Y);

endmodule


// mux 4:1 Tabla 01 Ejercicio 01
module t1mux41(input wire A, B, C, output wire Y);

  mux41 U1(B, A, C, ~C, ~C, C, Y);

endmodule

// mux 2:1 Tabla 01 Ejercicio 01
module t1mux21(input wire A, B, C, output wire Y);

  wire d0, d1;

  assign d0 = B ^ C;
  assign d1 = B ~^ C;

  mux21 U1(A, d0, d1, Y);

endmodule





// mux 8:1 Tabla 02 Ejercicio 01
module t2mux81(input wire A, B, C, output wire Y);

  wire VCC, GND;

  assign VCC = 1;
  assign GND = 0;

  mux81 U1(C, B, A, VCC, VCC, GND, GND, VCC, VCC, VCC, GND, Y);

endmodule


// mux 4:1 Tabla 02 Ejercicio 01
module t2mux41(input wire A, B, C, output wire Y);

  wire VCC, GND;

  assign VCC = 1;
  assign GND = 0;

  mux41 U1(B, A, VCC, GND, VCC, ~C, Y);

endmodule

// mux 2:1 Tabla 02 Ejercicio 01
module t2mux21(input wire A, B, C, output wire Y);

  wire d0, d1;

  assign d0 = ~B;
  assign d1 = B ~& C;

  mux21 U1(A, d0, d1, Y);

endmodule


