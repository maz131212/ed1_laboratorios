module tabla02pos();

// POS de la tabla 02

  reg A, B, C;
  wire o1, o2, o3, o4, o5, Y;

  // not (salida, entrada);
  // or (salida, entrada1, entrada2, entrada3, etc);
  // and (salida, entrada1, entrada2, entrada3, etc);

  or  U1(o1,  A,  B,  C);
  or  U2(o2,  A, ~B,  C);
  or  U3(o3,  A, ~B, ~C);
  or  U4(o4, ~A,  B,  C);
  or  U5(o5, ~A,  B, ~C);


  and U6(Y, o1, o2, o3, o4, o5);


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
      $dumpfile("tabla02pos_tb.vcd");
      $dumpvars(0, tabla02pos);
    end

endmodule
