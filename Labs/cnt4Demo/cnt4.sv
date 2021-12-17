module cnt4(input wire logic clk, clr, output logic [3:0] led);

    logic[25:0] cnt;
    always_ff @(posedge clk)
        if (clr)
            cnt <= 0;
         else
            cnt <= cnt + 1;
     
     assign led = cnt>>22;
endmodule

