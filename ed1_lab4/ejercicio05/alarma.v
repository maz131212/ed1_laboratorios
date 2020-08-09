///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 09 - AGOSTO - 2020
/////
///// LABORATORIO 04
///// EJERCIO 05




// SOP con Gate Level Modelling
// Ecuación a implementar: Y = (A * B' * C') + (A * B' * C) + (A * B * C);
module SOP_gateLevel(input wire A, B, C, output wire Y);

  wire notB, notC, a1, a2, a3;

  not (notB, B);
  not (notC, C);

  and (a1,    A, notB, notC);
  and (a2,    A, notB,    C);
  and (a3,    A,    B,    C);

  or  (Y, a1, a2, a3);

endmodule


// SOP con operadores
// Función a implementar: Y = (A * B' * C') + (A * B' * C) + (A * B * C);
module SOP_operadores(input wire A, B, C, output wire Y);

  assign Y = (A & ~B & ~C) | (A & ~B & C) | (A & B & C);

endmodule



// POS con Gate Level Modelling
// Ecuación a implementar:
// Y = (A + B + C) * (A + B + C') * (A + B' + C) * (A + B' + C') * (A' + B' + C) ;
module POS_gateLevel(input wire A, B, C, output wire Y);

  wire notA, notB, notC, o1, o2, o3, o4, o5;

  not (notA, A);
  not (notB, B);
  not (notC, C);

  or (o1,    A,    B,    C);
  or (o2,    A,    B, notC);
  or (o3,    A, notB,    C);
  or (o4,    A, notB, notC);
  or (o5, notA, notB,    C);

  and  (Y, o1, o2, o3, o4, o5);

endmodule


// POS con operadores
// Función a implementar:
// Y = (A + B + C) * (A + B + C') * (A + B' + C) * (A + B' + C') * (A' + B' + C) ;
module POS_operadores(input wire A, B, C, output wire Y);

  assign Y = (A | B | C) & (A | B | ~C) & (A | ~B | C) & (A | ~B | ~C) & (~A | ~B | C);

endmodule



// Ecuación simplificada con Gate Level Modelling
// Ecuación a implementar: Y = (A * B') + (A * C);
module ES_gateLevel(input wire A, B, C, output wire Y);

  wire notB, a1, a2;

  not (notB, B);


  and (a1,    A, notB);
  and (a2,    A,    C);

  or  (Y, a1, a2);

endmodule


// Ecuación simplificada con operadores
// Función a implementar: Y = (A * B') + (A * C);
module ES_operadores(input wire A, B, C, output wire Y);

  assign Y = (A & ~B) | (A & C);

endmodule
