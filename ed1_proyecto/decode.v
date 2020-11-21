//-----------------------------------------------------
// ELECTRÓNICA DIGITAL 1
// AXEL MAZARIEGOS - 131212
// 16 - NOVIEMBRE - 2020
//
// PROYECTO 02
// PROCESADOR EN HDL
// DECODE
//-----------------------------------------------------
//-----------------------------------------------------


module decode(input wire phase,  
              input wire z_flag,
              input wire c_flag,
              input wire [3:0] instr,

              output wire incPC,
              output wire loadPC,
              output wire loadA,
              output wire loadFlags,
              output wire [2:0] fun,
              output wire csRAM,
              output wire weRAM,
              output wire oeALU,
              output wire oeIN,
              output wire oeOprnd,
              output wire loadOut);
    
    reg [12:0] signalsReg;

    wire [6:0] address;

    assign address = {instr, c_flag, z_flag, phase};
    
    always @ (instr or c_flag or z_flag or phase)
        casez(address)
            // any
            7'b????_??0: signalsReg <= 13'b1000_000_001000;
            // JC
            7'b0000_1?1: signalsReg <= 13'b0100_000_001000;
            7'b0000_0?1: signalsReg <= 13'b1000_000_001000;
            // JNC
            7'b0001_1?1: signalsReg <= 13'b1000_000_001000;
            7'b0001_0?1: signalsReg <= 13'b0100_000_001000;
            // CMPI
            7'b0010_??1: signalsReg <= 13'b0001_001_000010;
            // CMPM
            7'b0011_??1: signalsReg <= 13'b1001_001_100000;
            // LIT
            7'b0100_??1: signalsReg <= 13'b0011_010_000010;
            // IN
            7'b0101_??1: signalsReg <= 13'b0011_010_000100;
            // LD
            7'b0110_??1: signalsReg <= 13'b1011_010_100000;
            // ST
            7'b0111_??1: signalsReg <= 13'b1000_000_111000;
            // JZ
            7'b1000_?11: signalsReg <= 13'b0100_000_001000;
            7'b1000_?01: signalsReg <= 13'b1000_000_001000;
            // JNZ
            7'b1001_?11: signalsReg <= 13'b1000_000_001000;
            7'b1001_?01: signalsReg <= 13'b0100_000_001000;
            // ADDI
            7'b1010_??1: signalsReg <= 13'b0011_011_000010;
            // ADDM
            7'b1011_??1: signalsReg <= 13'b1011_011_100000;
            // JMP
            7'b1100_??1: signalsReg <= 13'b0100_000_001000;
            // OUT
            7'b1101_??1: signalsReg <= 13'b0000_000_001001;
            // NANDI
            7'b1110_??1: signalsReg <= 13'b0011_100_000010;
            // NANDM
            7'b1111_??1: signalsReg <= 13'b1011_100_100000;
            default: signalsReg <= 13'b1111111111111;
        endcase


    assign incPC = signalsReg[12];
    assign loadPC = signalsReg[11];
    assign loadA = signalsReg[10];
    assign loadFlags = signalsReg[9];
    assign fun = signalsReg[8:6];
    assign csRAM = signalsReg[5];
    assign weRAM = signalsReg[4];
    assign oeALU = signalsReg[3];
    assign oeIN = signalsReg[2];
    assign oeOprnd = signalsReg[1];
    assign loadOut = signalsReg[0];
   


endmodule
