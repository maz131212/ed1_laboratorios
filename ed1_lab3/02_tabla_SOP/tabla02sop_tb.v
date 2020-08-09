module tabla02sop();

// SOP de la tabla 02

  reg A, B, C;
  wire a1, a2, a3, Y;

  // not (salida, entrada);
  // or (salida, entrada1, entrada2, entrada3, etc);
  // and (salida, entrada1, entrada2, entrada3, etc);

  and  U1(a1, ~A, ~B,  C);
  and  U2(a2,  A,  B, ~C);
  and  U3(a3,  A,  B,  C);


  or U4(Y, a1, a2, a3);


  initial begin
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", A, B, C, Y);
    A = 0; B = 0; C = 0;
    #1               C = 1;
    #1        B = 1; C = 0;
    #1               C = 1;
    #1 A = 1; B = 0; C = 0;
    #1               C = 1;
    #1        B = 1; C = 0;
    #1               C = 1;
    #1 $finish;
  end

  initial
    begin
      $dumpfile("tabla02sop_tb.vcd");
      $dumpvars(0, tabla02sop);
    end

endmodule
