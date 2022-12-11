module check_key(clk_div, keyCol, keyRow, value);
    input clk_div;
    input [3:0] keyCol;
    output [3:0] keyRow;
    output [3:0] value;

    reg [3:0] value, keyRow;

    always@(posedge clk_div)
    begin
        case({keyRow, keyCol})
            8'b1110_1110: value <= 4'h7;
            8'b1110_1101: value <= 4'h4;
            8'b1110_1011: value <= 4'h1;
            8'b1110_0111: value <= 4'h0;
            8'b1101_1110: value <= 4'h8;
            8'b1101_1101: value <= 4'h5;
            8'b1101_1011: value <= 4'h2;
            8'b1101_0111: value <= 4'ha;
            8'b1011_1110: value <= 4'h9;
            8'b1011_1101: value <= 4'h6;
            8'b1011_1011: value <= 4'h3;
            8'b1011_0111: value <= 4'hb;
            8'b0111_1110: value <= 4'hc;
            8'b0111_1101: value <= 4'hd;
            8'b0111_1011: value <= 4'he;
            8'b0111_0111: value <= 4'hf;
            default: value <= value;
        endcase

        case(keyRow)
            4'b1110: keyRow <= 4'b1101;
            4'b1101: keyRow <= 4'b1011;
            4'b1011: keyRow <= 4'b0111;
            4'b0111: keyRow <= 4'b1110;
            default: 4'b1101;
        endcase
    end
endmodule