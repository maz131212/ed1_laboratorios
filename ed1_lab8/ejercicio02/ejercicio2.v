///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 23 - OCTUBRE - 2020
/////
///// LABORATORIO 08
///// EJERCICIO 02


// ROM 4k x 8
module rom();

  reg [7:0] rom [0:4095];

  initial begin


    $readmemb("memoria.list",rom)


  end



endmodule



