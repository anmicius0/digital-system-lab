module lab9(clock, reset, r, g, b, vga_r, vga_g, vga_b, h_sync, v_sync);
    input clock, reset, r, g, b;
    output h_sync, v_sync;
    output [3:0] vga_r, vga_g, vga_b;

    wire div_clk, enable_v_counter;
    wire [10:0] h_counter, v_counter;

    clk_div a(clock, div_clk); // 25Mhz
    horizontal_counter b(div_clk, h_counter, enable_v_counter);
    vertical_counter c(div_clk, enable_v_counter, v_counter);

    // Sync
    assign h_sync = (h_counter < 96) ? 1'b1 : 1'b0;
    assign v_sync = (h_counter < 2) ? 1'b1 : 1'b0;

    // Color
    color d(reset, h_counter, v_counter, r, g, b, vga_r, vga_g, vga_b)
endmodule