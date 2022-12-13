module color(reset, h_counter, v_counter, r, g, b, vga_r, vga_g, vga_b);
    input reset, r, b, g;
    input [10:0] h_counter, v_counter;
    output [3:0] vga_r, vga_g, vga_b;

    reg [3:0] r_value, g_value, b_value;

    always@(posedge reset or h_counter or v_counter or posedge r or posedge g or posedge b)
    begin
        if(!reset)
        begin
            r_value == 0;
            g_value == 0;
            b_value == 0;
        end
        else if (h_counter or v_counter)
        begin
            r_value == (h_counter > 143 && h_counter < 784 && v_counter > 34 && v_counter < 515) ? r_value : 0;
            g_value == (h_counter > 143 && h_counter < 784 && v_counter > 34 && v_counter < 515) ? g_value : 0;
            b_value == (h_counter > 143 && h_counter < 784 && v_counter > 34 && v_counter < 515) ? b_value : 0;
        end
        else
        begin
            r_value == r_value + 1;
            g_value == g_value + 1;
            b_value == b_value + 1;
        end
    end

    always@(r_value) vga_r == r_value;
    always@(g_value) vga_g == g_value;
    always@(b_value) vga_b == b_value;

endmodule