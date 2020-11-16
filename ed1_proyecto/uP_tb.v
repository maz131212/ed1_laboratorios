///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 13 - NOVIEMBRE - 2020
/////
///// PROYECTO 02
///// PROCESADOR EN HDL



module ejercicio1();

  reg csRAM;
  reg weRAM;
  reg [11:0] addressRAM;

  wire [3:0] dataBus;

                                
  RAM U1(csRAM, weRAM, addressRAM, dataBus);

  assign dataBus = 4'b0010;

  
  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" RAM ");
    $display("cs we add | data ");
    $display("----------|------");
    $monitor("%b  %b  %h | %b ", csRAM, weRAM, addressRAM, dataBus);
  
    addressRAM = 12'h001; 
    csRAM = 0;
    weRAM = 0; 
    #10

    csRAM = 1;
    weRAM = 1;
    #10

    weRAM = 0;
    addressRAM = 12'h005;
    #10 

    csRAM = 0;
    weRAM = 0; 
    #10

    weRAM = 1;
    #10

    weRAM = 0;
    addressRAM = 12'h002;
    #10 


    addressRAM = 12'b000000010001; 
    csRAM = 1;
    weRAM = 0; 
    #10
    
    #20

    $finish;

    
  end

  /*
  initial begin
    $dumpfile("ejercicio1_tb.vcd");
    $dumpvars(0, ejercicio1);
  end
  */

endmodule
