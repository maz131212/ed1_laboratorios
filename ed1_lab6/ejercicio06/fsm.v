///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 05 - SEPTIEMBRE - 2020
/////
///// LABORATORIO 06
///// EJERCIO 06


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

// Ejercicio 01
module ejercicio01(input wire A, B, clk, reset, output wire Y, output wire [1:0] spresente, sfuturo);

  // Cables necesarios para interconexiones
  wire s0presente, s1presente, s0futuro, s1futuro;

  // Estado futuro
  assign s1futuro = (s0presente & B) | (s1presente & A & B);
  assign s0futuro = (~s1presente & ~s0presente & A);

  //Salida
  assign Y = (s1presente & A & B);

  FFD s1(clk, reset, s1futuro, s1presente);
  FFD s0(clk, reset, s0futuro, s0presente);


  assign spresente = {s1presente, s0presente};
  assign sfuturo = {s1futuro, s0futuro};

endmodule

// Ejercicio 03
module ejercicio03(input wire A, clk, reset, output wire [2:0] salida, spresente, sfuturo);

  // Cables necesarios para interconexiones
  wire s0presente, s1presente, s2presente, s0futuro, s1futuro, s2futuro, Y2, Y1, Y0;

  // Estado futuro
  assign s2futuro = (s2presente & s1presente & ~s0presente) | (s2presente & ~s1presente & A) | (s2presente & s0presente & ~A) | (~s2presente & ~s1presente & ~s0presente & ~A) | (~s2presente & s1presente & s0presente & A); 
  assign s1futuro = (~s1presente & ~s0presente & ~A) | (s1presente & ~s0presente & A) | (~s1presente & s0presente & A) | (s1presente & s0presente & ~A);
  assign s0futuro = (~s0presente);

  //Salidas
  assign Y2 = (s2presente);
  assign Y1 = (s2presente ^ s1presente);
  assign Y0 = (s1presente ^ s0presente);

  FFD s2(clk, reset, s2futuro, s2presente);
  FFD s1(clk, reset, s1futuro, s1presente);
  FFD s0(clk, reset, s0futuro, s0presente);


  assign spresente = {s2presente, s1presente, s0presente};
  assign sfuturo = {s2futuro, s1futuro, s0futuro};
  assign salida = {Y2, Y1, Y0};

endmodule

