module tb_dff;
    logic clk, rst_n, d;
    logic q;           
    logic expected_q;   
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );
    always #5 clk = ~clk;
    task checkertask;
        if (q !== expected_q) begin
            $display("Test failed at time %0t: expected_q=%0b, q=%0b", $time, expected_q, q);
        end
        else begin
            $display("Test passed at time %0t: expected_q=%0b, q=%0b", $time, expected_q, q);
        end
    endtask
    initial begin
        $dumpfile("dumpfile.vcd");
    	$dumpvars(1);
        clk = 0;
        rst_n = 0; d = 0; expected_q = 0;
        #10 rst_n = 1;  
        #10 rst_n = 0; 
        #10 rst_n = 1; 
        #5  expected_q = 0; checkertask();
        #10 d = 1; expected_q = 1;
        #10 checkertask(); 
        #10 d = 1; expected_q = 1;
        #10 checkertask();
        #10 d = 0; expected_q = 0;
        #10 checkertask();
        $finish;
    end
endmodule
