module state(div_clk, reset);
    input div_clk, reset;
    output h_sync, v_sync;

    reg [10:0] h_count, v_count;

    always@(posedge div_clk)
    begin
        if(h_sync < 800) h_count <= h_count + 1;
        else h_count <= 0;

        if(v_count < 525) v_count <= v_count + 1;
        else v_count <= 0;
    end

endmodule