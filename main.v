module lab9(clock, reset, keyCol, keyRow, dot_row, dot_col);
    input clock, reset;
    input [3:0] keyCol;
    output [3:0] keyRow;
    output [7:0] dot_row, dot_col;

    wire div_clk, ani_clk;
    wire [3:0] value;

    clk_div a(clock, div_clk);
    animate_clock e(clock, ani_clk);
    
    check_key b(div_clk, keyCol, keyRow, value);

    matrix_display c(value, ani_clk, dot_row, dot_col);
endmodule