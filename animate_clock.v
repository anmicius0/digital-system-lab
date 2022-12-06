// 10000 Hz
`define TimeExpire 32'd2500

module animate_clock(clk, ani_clk);
    input clk;
    output ani_clk;

    reg ani_clk;
    reg [31:0]count;

    always@(posedge clk)
    begin
        if(count == `TimeExpire)
        begin
            count <= 32'd0;
            ani_clk <= ~ani_clk;
        end
        else
        begin
            count <= count + 1;
        end
    end
endmodule