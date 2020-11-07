///// ELECTRÓNICA DIGITAL 1
///// AXEL MAZARIEGOS - 131212
///// 06 - NOVIEMBRE - 2020
/////
///// LABORATORIO 10
///// EJERCICIO 01



module ejercicio1();

  reg clkPC;
  reg resetPC;
  reg enablePC;
  reg loadPC;
  reg [11:0] addressRAM;

  wire [7:0] ProgramByte;
  
  reg clkF; 
  reg resetF; 
  reg enableF; 
  
  wire [3:0] Instr;
  wire [3:0] Oprnd;
                                
  elmodulo U1(clkPC, resetPC, enablePC, loadPC, addressRAM,
              ProgramByte,
              clkF, resetF, enableF, 
              Instr, Oprnd)
  ;

  
  initial begin
    #5 $display(" ");
    $display(" ");
    $display(" Contador ");
    $display("c r e l | PB I O");
    $display("--------|-------");
    $monitor("%b %b %b %b | %h %h %h ", clkPC, resetPC, enablePC, loadPC, ProgramByte, Instr, Oprnd);
  
    addressRAM = 12'b000000011110; //30 el número que se cargará

    clkPC = 0;
    clkF = 0; 

    //reset (para iniciar en 0)
    resetPC = 1; enablePC = 0; loadPC = 0;
    resetF = 1; enableF = 0;
    #2

    //no contar PC
    resetPC = 0; enablePC = 0; loadPC = 0;
    resetF = 0; enableF = 0;
    #10

    //contar PC
    resetPC = 0; enablePC = 1; loadPC = 0;
    #20

    //no contar
    resetPC = 0; enablePC = 0; loadPC = 0;
    #10

    //contar PC y habilitar Fetch
    resetPC = 0; enablePC = 1; loadPC = 0;
    enableF = 1;
    #20

    //no contar
    resetPC = 0; enablePC = 0; loadPC = 0;
    #10

    //cargar PC
    resetPC = 0; enablePC = 0; loadPC = 1;
    #20

    //contar PC
    resetPC = 0; enablePC = 1; loadPC = 0;
    #20

    //reset (para iniciar en 0)
    resetPC = 1; enablePC = 0; loadPC = 0;
    resetF = 1; enableF = 0;
    #2

    //contar PC y habilitar Fetch
    resetPC = 0; enablePC = 1; loadPC = 0;
    enableF = 1;
    #20

    $finish;

    
  end


  always #2 clkPC = ~clkPC;

  always #2 clkF = ~clkF;


  initial begin
    $dumpfile("ejercicio1_tb.vcd");
    $dumpvars(0, ejercicio1);
  end

endmodule
