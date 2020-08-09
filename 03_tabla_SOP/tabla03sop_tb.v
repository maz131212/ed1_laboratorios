module tabla03sop();

// SOP de la tabla 03

  reg A, B, C, D;
  wire a1, a2, a3, a4, a5, a6, a7, Y;

  // not (salida, entrada);
  // or (salida, entrada1, entrada2, entrada3, etc);
  // and (salida, entrada1, entrada2, entrada3, etc);

  and  U1(a1, ~A, ~B, ~C, ~D);
  and  U2(a2, ~A, ~B, ~C,  D);
  and  U3(a3, ~A, ~B,  C, ~D);
  and  U4(a4, ~A, ~B,  C,  D);
  and  U5(a5,  A, ~B, ~C, ~D);
  and  U6(a6,  A, ~B,  C, ~D);
  and  U7(a7,  A,  B,  C, ~D);


  or U8(Y, a1, a2, a3, a4, a5, a6, a7);


  initial begin
    $display("A B C D | Y");
    $display("--------|--");
    $monitor("%b %b %b %b | %b", A, B, C, D, Y);
       A = 0; B = 0; C = 0; D = 0;
    #1                      D = 1;
    #1               C = 1; D = 0;
    #1                      D = 1;
    #1        B = 1; C = 0; D = 0;
    #1                      D = 1;
    #1               C = 1; D = 0;
    #1                      D = 1;
    #1 A = 1; B = 0; C = 0; D = 0;
    #1                      D = 1;
    #1               C = 1; D = 0;
    #1                      D = 1;
    #1        B = 1; C = 0; D = 0;
    #1                      D = 1;
    #1               C = 1; D = 0;
    #1                      D = 1;
    #1 $finish;
  end

  initial
    begin
      $dumpfile("tabla03sop_tb.vcd");
      $dumpvars(0, tabla03sop);
    end

endmodule
