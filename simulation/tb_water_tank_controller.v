`timescale 1ns/1ps

module tb_water_tank_controller;

    reg clk = 0;
    reg rst_n = 0;
    reg level_low = 0;
    reg level_full = 0;
    reg dry_run_fault = 0;

    wire pump_en;
    wire alarm;

    integer errors = 0;

    water_tank_controller dut (
        .clk(clk),
        .rst_n(rst_n),
        .level_low(level_low),
        .level_full(level_full),
        .dry_run_fault(dry_run_fault),
        .pump_en(pump_en),
        .alarm(alarm)
    );

    always #5 clk = ~clk;

    task check_outputs;
        input expected_pump;
        input expected_alarm;
        input [200*8:1] test_name;
        begin
            #1;
            if (pump_en !== expected_pump ||
                alarm !== expected_alarm) begin
                $display("FAIL: %0s | pump=%b alarm=%b",
                         test_name, pump_en, alarm);
                errors = errors + 1;
            end else begin
                $display("PASS: %0s", test_name);
            end
        end
    endtask

    task next_cycle;
        begin
            @(posedge clk);
            #1;
        end
    endtask

    initial begin
        $dumpfile("results/water_tank.vcd");
        $dumpvars(0, tb_water_tank_controller);

        // Test 1: Reset
        rst_n = 0;
        level_low = 0;
        level_full = 0;
        dry_run_fault = 0;
        next_cycle;
        check_outputs(0, 0, "Reset");

        // Release reset
        @(negedge clk);
        rst_n = 1;

        // Test 2: Low water -> pump ON
        level_low = 1;
        level_full = 0;
        next_cycle;
        check_outputs(1, 0, "Low water starts pump");

        // Test 3: Intermediate level -> retain pump ON
        @(negedge clk);
        level_low = 0;
        level_full = 0;
        next_cycle;
        check_outputs(1, 0, "Intermediate level retains pump");

        // Test 4: Full tank -> pump OFF
        @(negedge clk);
        level_full = 1;
        next_cycle;
        check_outputs(0, 0, "Full tank stops pump");

        // Test 5: Dry-run fault -> pump OFF, alarm ON
        @(negedge clk);
        level_full = 0;
        level_low = 1;
        dry_run_fault = 1;
        check_outputs(0, 1, "Dry-run fault");

        next_cycle;
        check_outputs(0, 1, "Fault keeps pump disabled");

        // Clear fault; low level should start pump again
        @(negedge clk);
        dry_run_fault = 0;
        next_cycle;
        check_outputs(1, 0, "Pump restarts after fault clears");

        // Test 6: Invalid combination (low and full together)
        @(negedge clk);
        level_low = 1;
        level_full = 1;
        check_outputs(0, 1, "Invalid sensor combination");

        next_cycle;
        check_outputs(0, 1, "Invalid combination keeps safe outputs");

        // Test 7: Reset while pump is active
        @(negedge clk);
        level_low = 0;
        level_full = 0;
        rst_n = 0;
        next_cycle;
        check_outputs(0, 0, "Reset while operating");

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d error(s)", errors);

        $finish;
    end

endmodule
