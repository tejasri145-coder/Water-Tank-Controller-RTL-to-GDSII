module water_tank_controller (
    input  wire clk,
    input  wire rst_n,
    input  wire level_low,
    input  wire level_full,
    input  wire dry_run_fault,
    output reg  pump_en,
    output reg  alarm
);

    localparam IDLE    = 2'b00;
    localparam PUMPING = 2'b01;
    localparam FULL    = 2'b10;

    reg [1:0] state;
    reg [1:0] next_state;

    wire invalid_level = level_low && level_full;
    wire safety_fault  = dry_run_fault || invalid_level;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        next_state = state;

        if (safety_fault) begin
            next_state = IDLE;
        end else begin
            case (state)
                IDLE: begin
                    if (level_low)
                        next_state = PUMPING;
                    else
                        next_state = IDLE;
                end

                PUMPING: begin
                    if (level_full)
                        next_state = FULL;
                    else
                        next_state = PUMPING;
                end

                FULL: begin
                    if (!level_full && level_low)
                        next_state = PUMPING;
                    else if (!level_full)
                        next_state = IDLE;
                    else
                        next_state = FULL;
                end

                default: next_state = IDLE;
            endcase
        end
    end

    // Output logic
    always @(*) begin
        pump_en = 1'b0;
        alarm   = 1'b0;

        if (safety_fault) begin
            pump_en = 1'b0;
            alarm   = 1'b1;
        end else begin
            case (state)
                PUMPING: pump_en = 1'b1;
                default: pump_en = 1'b0;
            endcase
        end
    end

endmodule
