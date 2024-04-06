`timescale 1ns/1ps
module registerfile_tb();

    // Parameters
    parameter DataWidth  = 32;
    parameter RegAddress = 5;

    // Signals
    logic clk;
    logic rst;
    logic write_enable;
    logic [RegAddress-1 : 0] source1;
    logic [RegAddress-1 : 0] source2;
    logic [RegAddress-1 : 0] writedata_add;
    logic [DataWidth-1  : 0] write_data;
    logic [DataWidth-1 : 0]  readdata1;
    logic [DataWidth-1 : 0]  readdata2;

    // Instantiate register file module
    register_file #(DataWidth, RegAddress)
    u_registerfile(
        .clk(clk),
        .rst(rst),
        .write_enable(write_enable),
        .source1(source1),
        .source2(source2),
        .writedata_add(writedata_add),
        .write_data(write_data),
        .readdata1(readdata1),
        .readdata2(readdata2)
    );

    // Test stimulus
    initial begin
        clk = 0;
        rst = 1;
        write_enale = 0;
        source1 = 5'b0;
        source2 = 5'b1;
        writedata_add = 5'b0;
        write_data = 32'hABCDEFFF;

        // Reset
        #10 rst = 0;

        // Write operation
        #10;
        write_enale = 1;
        writedata_add = 5'b0;
        write_data = 32'h12345678;
        #10;
        write_enale = 1;
        writedata_add = 5'b1;
        write_data = 32'd10;
        #10;
        write_enale = 0;

        // Read operation
        #10;
        source1 = 5'b0;
        source2 = 5'b1;
        #10;

        // End simulation
        $finish;
    end

    // Clock generation
    always begin
        #5 clk= ~clk;
    end

    initial begin 
        $dumpfile("registerfile.vcd");
        $dumpvars(0,registerfile_tb);
    end

endmodule