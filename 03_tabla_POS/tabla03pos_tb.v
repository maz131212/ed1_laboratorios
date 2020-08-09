module tabla03pos();

// POS de la tabla 03

  reg A, B, C, D;
  wire o1, o2, o3, o4, o5, o6, o7, o8, o9, Y;

  // not (salida, entrada);
  // or (salida, entrada1, entrada2, entrada3, etc);
  // and (salida, entrada1, entrada2, entrada3, etc);

  or  U1(o1,  A, ~B,  C,  D);
  or  U2(o2,  A, ~B,  C, ~D);
  or  U3(o3,  A, ~B, ~C,  D);
  or  U4(o4,  A, ~B, ~C, ~D);
  or  U5(o5, ~A,  B,  C, ~D);
  or  U6(o6, ~A,  B, ~C,  D);
  or  U7(o7, ~A, ~B,  C,  D);
  or  U8(o8, ~A, ~B,  C, ~D);
  or  U9(o9, ~A, ~B, ~C, ~D);

  and U10(Y, o1, o2, o3, o4, o5, o6, o7, o8, o9);


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
      $dumpfile("tabla03pos_tb.vcd");
      $dumpvars(0, tabla03pos);
    end

endmodule
