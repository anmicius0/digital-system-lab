module state(div_clk, reset, status, value);
    input div_clk, reset;
    output [1:0] status; 
    output [3:0]value;
    
    reg [1:0] status;
    reg [3:0] value;
    parameter GREEN = 2'd0,
              YELLO = 2'd1,
              RED = 2'd2;

    always@(posedge div_clk or negedge reset)
    begin
        if(!reset)
            status <= GREEN;
            value <= 4'd15;
        else
        begin
            if(value == 0)
            begin
                case(status)
                    GREEN:
                    begin
                        status <= YELLO;
                        value <= 4'd5;
                    end
                    YELLO:
                    begin
                        status <= RED;
                        value <= 4'd10;
                    end
                    RED:
                    begin
                        status <= GREEN;
                        value <= 4'd15;
                    end
                endcase
            end        
            else
                value <= value - 1;
        end
    end

endmodule