//-----------------------------------------------------
// ELECTRÓNICA DIGITAL 1
// AXEL MAZARIEGOS - 131212
// 16 - NOVIEMBRE - 2020
//
// PROYECTO 02
// PROCESADOR EN HDL
// ALU
//-----------------------------------------------------
//-----------------------------------------------------



module ALU(input wire [3:0] A,      // accu
           input wire [3:0] B,      // data_bus
           input wire [2:0] F,      // funcion (proveniente del Decode)
           output wire C, Z,        // carry y Z
           output wire [3:0] S);    // salida de la alu
    
    reg [4:0] regS; // bandera para obtener el carry de forma sencilla
    
    always @ (A, B, F)
        case (F)
            3'b000: regS = A;                   // deja pasar el dato del Accumulator
            3'b001: regS = A - B;               // para comparar
            3'b010: regS = B;                   // deja pasar el dato del data_bus
            3'b011: regS = A + B;               // suma lo que esta en el Accumulator y en el data_bus
            3'b100: regS = {1'b0, ~(A & B)};    // NAND
            //default: regS = 5'b10101;
        endcase
    
    assign S = regS[3:0];   // la salida seran los 4 bits menos significativos de la bandera
    
    assign C = regS[4];     // el carry será el bit más significativo de la bandera
    
    assign Z = ~(regS[3] | regS[2] | regS[1] | regS[0]);
    // cuando la salida es 0000 Z será 1, de lo contrario será 0
    
endmodule
