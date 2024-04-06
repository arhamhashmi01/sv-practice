module andgate_tb ();

    logic a;
    logic b;
    logic out;

    initial begin 
        a = 1'b1;
        b = 1'b0;
        #10
        a = 1'b1;
        b = 1'b1;
        #10
        a = 1'b0;
        b = 1'b0;
        #10
        $finish;
    end

    and_gate u_andgate(
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin
      $dumpfile("andgate.vcd");
      $dumpvars(0,andgate_tb);
    end

endmodule