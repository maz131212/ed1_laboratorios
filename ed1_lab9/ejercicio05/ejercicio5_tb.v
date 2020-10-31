///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 31 - OCTUBRE - 2020
/////
///// LABORATORIO 09
///// EJERCICIO 05


module ejercicio5();


reg [6:0] entrada;
wire [12:0] salida;

ROM U1(entrada, salida);

initial begin
   #1 $display(" ");
   $display(" ");
   $display("ROM con cases");
   $display("A       |   Y");
   $display("--------|--------------");
   $monitor(" %b | %b  ", entrada, salida);
   end

initial begin

//pruebas con entrada[0] = 0
//any
    entrada =7'b1111110 ;
#10 entrada =7'b0101010 ;
#10 entrada =7'b1010100 ;
#10 entrada =7'b1100110 ;

//JC
#10 entrada =7'b0000101 ;
#10 entrada =7'b0000111 ;

//JC
#10 entrada =7'b0000001 ;
#10 entrada =7'b0000011 ;

//JNC
#10 entrada =7'b0001101 ;
#10 entrada =7'b0001111 ;

//JNC
#10 entrada =7'b0001001 ;
#10 entrada =7'b0001011 ;

//CMPI
#10 entrada =7'b0010011 ;
#10 entrada =7'b0010101 ;

//CMPM
#10 entrada =7'b0011001 ;
#10 entrada =7'b0011111 ;

//LIT
#10 entrada =7'b0100011 ;
#10 entrada =7'b0100101 ;

//IN
#10 entrada =7'b0101001 ;
#10 entrada =7'b0101111 ;

//LD
#10 entrada =7'b0110011 ;
#10 entrada =7'b0110101 ;

//ST
#10 entrada =7'b0111001 ;
#10 entrada =7'b0111111 ;

//JZ
#10 entrada =7'b1000011 ;
#10 entrada =7'b1000111 ;

//JZ
#10 entrada =7'b1000001 ;
#10 entrada =7'b1000101 ;

//JNZ
#10 entrada =7'b1001011 ;
#10 entrada =7'b1001111 ;

//JNZ
#10 entrada =7'b1001001 ;
#10 entrada =7'b1001101 ;

//ADDI
#10 entrada =7'b1010001 ;
#10 entrada =7'b1010111 ;

//ADDM
#10 entrada =7'b1011011 ;
#10 entrada =7'b1011101 ;

//JMP
#10 entrada =7'b1100001 ;
#10 entrada =7'b1100111 ;

//OUT
#10 entrada =7'b1101011 ;
#10 entrada =7'b1101101 ;

//NORI
#10 entrada =7'b1110001 ;
#10 entrada =7'b1110111 ;

//NORM
#10 entrada =7'b1111011 ;
#10 entrada =7'b1111101 ;


 #10 $finish;
end




  initial begin
    $dumpfile("ejercicio5_tb.vcd");
    $dumpvars(0, ejercicio5);
  end

endmodule
