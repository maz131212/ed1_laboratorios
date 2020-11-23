///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 22 - NOVIEMBRE - 2020
/////
///// PROYECTO 02
///// PROCESADOR EN HDL
///// PRUEBAS



module inmediatos_tb();
/*

  reg clock, reset;
  reg [3:0] pushbuttons;
  wire phase, c_flag, z_flag;
  wire [3:0] instr, oprnd, accu, data_bus, FF_out;
  wire [7:0] program_byte;
  wire [11:0] PC, address_RAM;


  uP uPmodule(.clock(clock),
              .reset(reset),
              .pushbuttons(pushbuttons),
              .phase(phase),
              .c_flag(c_flag),
              .z_flag(z_flag),
              .instr(instr),
              .oprnd(oprnd),
              .accu(accu),
              .data_bus(data_bus),
              .FF_out(FF_out),
              .program_byte(program_byte),
              .PC(PC),
              .address_RAM(address_RAM));

  initial
      #160 $finish;
      
  always
      #5 clock = ~clock;

  initial begin
      clock = 0; reset = 0; pushbuttons = 4'b0110;
      #2 reset = 1;
      #1 reset = 0;
      //$display("\n");
      //$display("Implementación de procesador base");
      //$display("(Instrucciones inmediatas: CMPI, LIT, ADDI, IN, OUT, NANDI)");
      //$display("\n");
  end


  initial begin
    $dumpfile("inmediatos_tb.vcd");
    $dumpvars(0, inmediatos_tb);
  end


*/

endmodule

