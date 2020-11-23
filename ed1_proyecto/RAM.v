//-----------------------------------------------------
// ELECTRÓNICA DIGITAL 1
// AXEL MAZARIEGOS - 131212
// 13 - NOVIEMBRE - 2020
//
// PROYECTO 02
// PROCESADOR EN HDL
// RAM
//-----------------------------------------------------
//-----------------------------------------------------

module RAM( input wire chips,               // Señal proveniente del DECODE (csRAM)
            input wire enableRW,            // Señal proveniente del DECODE (weRAM)
            input wire [3:0] oprnd,         // Señal proveniente del FETCH (oprnd)
            input wire [7:0] program_byte,  // Señal proveniente de la ROM (program_byte)
            
            inout wire [3:0] data,          // Data (bi-direccional)

            output wire [11:0] address);    // Señal para el Pogram Counter (address_RAM)
            

    
    assign address = {oprnd, program_byte}; // Concatenendo la dirección de la RAM

    reg [3:0] data_out; // bandera para la información

    reg [3:0] mem [0:4095]; // declarando la memoria



    // Control como un buffer tri-estado
    assign data = (chips  &&  !enableRW) ? data_out : 4'bz; 

    // Si csRAM es 1 y weRAM es 0, deja salir el valor el valor de la bandera
    // De lo contrario estará en alta impedancia
    

    
    // Para leer de la RAM
    always @ (address or chips or enableRW)
        begin 
            if (chips &&  !enableRW)    
             data_out = mem[address];   
        end
    // Si csRAM es 1 y weRAM es 0
    // la bandera tendra el valor deseado de la memoria



    // Para escribir en la  RAM
    always @ (address or data or chips or enableRW)
        begin 
            if ( chips && enableRW )    
           mem[address] = data;         
        end
    // Si csRAM es 1 y weRAM es 1
    // la información proveniente del data_bus se guardará en la memoria


endmodule

