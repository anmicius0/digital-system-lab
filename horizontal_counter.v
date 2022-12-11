module horizontal_counter(div_clk, h_counter, enable_v_counter)
    input div_clk;
    output reg [10:0] h_counter;
    output reg enable_v_counter;

    always@(posedge div_clk)
    begin
        if(h_counter < 800)
        begin
            h_counter <= h_counter + 1;
            enable_v_counter <= 0;
        end
        else
        begin
            h_counter <= 0;
            enable_v_counter <= 1;
        end
    end
endmodule