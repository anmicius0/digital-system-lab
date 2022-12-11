// 25 MHZ
`define TimeExpire 32'd1

module clk_div(clk, div_clk);
    input clk;
    output div_clk;

    reg div_clk;
    reg [31:0]count;

    always@(posedge clk)
    begin
        if(count == `TimeExpire)
        begin
            count <= 32'd0;
            div_clk <= ~div_clk;
        end
        else
        begin
            count <= count + 1;
        end
    end
endmodule