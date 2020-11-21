
// ELECTRÓNICA DIGITAL 1
// AXEL MAZARIEGOS - 131212
// 13 - NOVIEMBRE - 2020
//
// PROYECTO 02
// PROCESADOR EN HDL
// RAM
//-----------------------------------------------------
//-----------------------------------------------------

module RAM( input wire chips,               // Chip Select
            input wire enableRW,            // Read Enable/Write Enable
            input wire [3:0] oprnd,         // Address part1
            input wire [7:0] program_byte,  // Address part2
            
            inout wire [3:0] data           // Data bi-directional
            );

    wire [11:0] address;

    assign address = {oprnd, program_byte};

    reg [3:0] data_out;

    reg [3:0] mem [0:4095];



    // Tri-State Buffer control 
    // output : When chips = 0, enableRW = 0
    assign data = ( ~chips  &&  ~enableRW) ? data_out : 4'bz; 

    

    // Memory Read Block 
    // Read Operation : When chips = 1, enableRW = 0
    always @ (address or chips or enableRW)
        begin : MEM_READ
            if (chips &&  ~enableRW)  begin
             data_out = mem[address];
        end
    end


    // Memory Write Block 
    // Write Operation : When chips = 1, enableRW = 1
    always @ (address or data or chips or enableRW)
        begin : MEM_WRITE
            if ( chips && enableRW ) begin
           mem[address] = data;
        end
    end





endmodule

