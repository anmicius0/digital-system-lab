module matrix(value, ani_clk, reset, dot_row, dot_col);
    input ani_clk, reset; 
    input [3:0] value;
    output [7:0] dot_row, dot_col;

    reg [7:0] dot_row, dot_col;
    reg [3:0] row_count;

    always@(posedge ani_clk)
    begin
        if(!reset)
        begin
            dot_row <= 8'b11111111;
            dot_col <= 8'b00000000;
        end
        else
        begin
            row_count <= (row_count + 1) % 2;
            
            case(value)
                    4'hf, 4'he, 4'hd, 4'hc: dot_row <= row_count == 0 ? 8'b01111111 : 8'b10111111; //0
                    4'hb, 4'h3, 4'h6, 4'h9: dot_row <= row_count == 0 ? 8'b11011111 : 8'b11101111; //0
                    4'ha, 4'h2, 4'h5, 4'h8: dot_row <= row_count == 0 ? 8'b11110111 : 8'b11111011; //0
                    4'h0, 4'h1, 4'h4, 4'h7: dot_row <= row_count == 0 ? 8'b11111101 : 8'b11111110; //0
                    default: dot_row <= 8'b01111111;
            endcase
            
            case(value)
                    4'hf, 4'hb, 4'ha, 4'h0: dot_col <= 8'b11000000;
                    4'h3, 4'he, 4'h2, 4'h1: dot_col <= 8'b00110000;
                    4'hd, 4'h6, 4'h5, 4'h4: dot_col <= 8'b00001100;
                    4'hc, 4'h9, 4'h8, 4'h7: dot_col <= 8'b00000011;
                    default: dot_row <= 8'b01111111;
            endcase
        end
    end
endmodule