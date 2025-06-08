module dff (
    input logic clk,      
    input logic rst_n,    
    input logic d,        
    output logic q     
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            q <= 0;
        else
            q <= d;
    end
endmodule
