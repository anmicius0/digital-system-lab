module vertical_counter(div_clk, enable_v_counter, v_counter);
    input div_clk, enable_v_counter;
    output reg [10:0] v_counter;

    always@(posedge div_clk)
    begin
        if(v_counter < 525 && enable_v_counter == 1) v_counter <= v_counter + 1;
        else v_counter <= 0;
    end
endmodule