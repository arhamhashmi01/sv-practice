`timescale 1ns/1ps
module half_adder_tb ();
    logic a_tb;
    logic b_tb;

    logic sum_tb;
    logic cout_tb;

    initial begin
        a_tb=0;
        b_tb=1;
        #5;
        a_tb=0;
        b_tb=1;
        #5;
        $finish;
    end
    half_adder u_half_adder0(
        .a(a_tb),
        .b(b_tb),
        .sum(sum_tb),
        .cout(cout_tb)
    );
    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0,halfadder_tb);
    end
endmodule