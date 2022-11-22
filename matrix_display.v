module matrix_display (status, ani_clk, dot_row, dot_col);
    input ani_clk; 
    input [1:0] status;
    output [7:0] dot_row, dot_col;

    reg [7:0] dot_row, dot_col;
    reg [3:0] row_count;
    parameter GREEN = 2'd0,
              YELLO = 2'd1,
              RED = 2'd2;

    always@(posedge ani_clk)
    begin
        row_count <= (row_count + 1) % 8;
        
        case(row_count)
                4'd0: dot_row <= 8'b01111111; //0
                4'd1: dot_row <= 8'b10111111; //1
                4'd2: dot_row <= 8'b11011111; //2
                4'd3: dot_row <= 8'b11101111; //3
                4'd4: dot_row <= 8'b11110111; //4
                4'd5: dot_row <= 8'b11111011; //5
                4'd6: dot_row <= 8'b11111101; //6
                4'd7: dot_row <= 8'b11111110; //7
                default: dot_row <= 8'b01111111;
        endcase
        
        case (status)
        GREEN:
        begin
            case(row_count)
                4'd0: dot_col <= 8'b00001100; //0
                4'd1: dot_col <= 8'b00001100; //1
                4'd2: dot_col <= 8'b00011001; //2
                4'd3: dot_col <= 8'b01111110; //3
                4'd4: dot_col <= 8'b10011000; //4
                4'd5: dot_col <= 8'b00011000; //5
                4'd6: dot_col <= 8'b00101000; //6
                4'd7: dot_col <= 8'b01001000; //7
                default: dot_col <= 8'b00001100;
            endcase
        end
        YELLO:
        begin
            case(row_count)
                4'd0: dot_col <= 8'b00000000; //0
                4'd1: dot_col <= 8'b00100100; //1
                4'd2: dot_col <= 8'b00111100; //2
                4'd3: dot_col <= 8'b10111101; //3
                4'd4: dot_col <= 8'b11111111; //4
                4'd5: dot_col <= 8'b00111100; //5
                4'd6: dot_col <= 8'b00111100; //6
                4'd7: dot_col <= 8'b00000000; //7
                default: dot_col <= 8'b00000000;
            endcase
        end
        RED:
        begin
            case(row_count)
                4'd0: dot_col <= 8'b00011000; //0
                4'd1: dot_col <= 8'b00011000; //1
                4'd2: dot_col <= 8'b00111100; //2
                4'd3: dot_col <= 8'b00111100; //3
                4'd4: dot_col <= 8'b01011010; //4
                4'd5: dot_col <= 8'b00011000; //5
                4'd6: dot_col <= 8'b00011000; //6
                4'd7: dot_col <= 8'b00011000; //7
                default: dot_col <= 8'00011000;
            endcase
        end
        endcase
    end
endmodule