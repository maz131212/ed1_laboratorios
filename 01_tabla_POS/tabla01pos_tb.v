module tabla01pos();

// POS de la tabla 01

  reg A, B, C;
  wire nA, nB, nC, o1, o2, o3, Y;

  // not (salida, entrada);
  // or (salida, entrada1, entrada2, entrada3, etc);
  // and (salida, entrada1, entrada2, entrada3, etc);
  not U1(nA, A);
  not U2(nB, B);
  not U3(nC, C);

  or  U4(o1,  A,  B, nC);
  or  U5(o2,  A, nB, nC);
  or  U6(o3, nA, nB,  C);

  and U7(Y, o1, o2, o3);


  initial begin
    $display("A B C | Y");
    $display("------|--");
    $monitor("%b %b %b | %b", A, B, C, Y);
    A = 0; B = 0; C = 0;
    #1 A = 0; B = 0; C = 1;
    #1 A = 0; B = 1; C = 0;
    #1 A = 0; B = 1; C = 1;
    #1 A = 1; B = 0; C = 0;
    #1 A = 1; B = 0; C = 1;
    #1 A = 1; B = 1; C = 0;
    #1 A = 1; B = 1; C = 1;
    #1 $finish;
  end

  initial
    begin
      $dumpfile("tabla01pos_tb.vcd");
      $dumpvars(0, tabla01pos);
    end

endmodule
