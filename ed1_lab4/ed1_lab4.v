///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 09 - AGOSTO - 2020
/////
///// LABORATORIO 04
///// EJERCIO 04


// EJERCICIO 01_01
// Función a implementar: Y = (A' * C') + (A * C) + (B' * C')

module operadores1_1(input wire A, B, C, output wire Y);

  assign Y = (~A & ~C) | (A & C) | (~B & ~C);

endmodule


// EJERCICIO 01_02
// Ecuación a implementar: Y = B';

module gateLevel1_2(input wire B, output wire Y);

  not (Y, B);

endmodule


// EJERCICIO 01_03
// Ecuación a implementar:
// Y = (A' * B' * C' * D') + (A' * B' * C * D) + (A' * B * C' * D) + (A' * B * C * D')
//    + (A * B * C' * D') + (A * B * C * D) + (A * B' * C' * D) + (A * B' * C * D');

module gateLevel1_3(input wire A, B, C, D, output wire Y);

  wire notA, notB, notC, notD, a1, a2, a3, a4, a5 ,a6, a7, a8;

  not (notA, A);
  not (notB, B);
  not (notC, C);
  not (notD, D);

  and (a1, notA, notB, notC, notD);
  and (a2, notA, notB,    C,    D);
  and (a3, notA,    B, notC,    D);
  and (a4, notA,    B,    C, notD);
  and (a5,    A,    B, notC, notD);
  and (a6,    A,    B,    C,    D);
  and (a7,    A, notB, notC,    D);
  and (a8,    A, notB,    C, notD);

  or  (Y, a1, a2, a3, a4, a5 ,a6, a7, a8);

  endmodule


// EJERCICIO 01_04
// Función a implementar: Y = (B' * D') + (B * D) + (A * B) + (A * C);

module operadores1_4(input wire A, B, C, output wire Y);

  assign Y = (~B & ~D) | (B & D) | (A & B) | (A & C);

endmodule
