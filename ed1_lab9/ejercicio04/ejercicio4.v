///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 30 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 04


// Buffer Tri-estado
module triestado(input  [3:0] A,
                 input  EN,
                 output  [3:0] Y);

  assign Y = EN ? A : 4'bZZZZ;

endmodule




