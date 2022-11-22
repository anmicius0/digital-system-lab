module lab9(clock, reset, dot_row, dot_col);
    input clock, reset;
    output [7:0] dot_row, dot_col;
    output [6:0] out;

    wire div_clk, ani_clk;
    wire [1:0] status;
    wire [3:0]value;

    clk_div a(clock, div_clk);
    animate_clock e(clock, ani_clk);

    state b(div_clk, reset, status, value);
    
    matrix_display c(status, ani_clk, dot_row, dot_col);
    seven_display d(value, out);
endmodule