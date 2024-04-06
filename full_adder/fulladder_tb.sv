`timescale 1ns/1ps
module fulladder_tb();
    logic a_tb;
    logic b_tb;
    logic cin_tb;
    logic sum_tb;
    logic cout_tb;

    initial begin
        //initial values
        a_tb=0;
        b_tb=0;
        cin_tb=0;
        #5;
        a_tb=1;
        b_tb=1;
        cin_tb=0;
        #5;
        a_tb=0;
        b_tb=1;
        cin_tb=0;
        #5;
        a_tb=1;
        b_tb=1;
        cin_tb=1;
        #5;
        $finish;      
    end

    fulladder u_fulladdre0 (
        .a(a_tb),
        .b(b_tb),
        .cin(cin_tb),
        .sum(sum_tb),
        .cout(cout_tb)
    );

    initial begin 
        $dumpfile("fulladder.vcd");
        $dumpvars(0,fulladder_tb);
    end
endmodule