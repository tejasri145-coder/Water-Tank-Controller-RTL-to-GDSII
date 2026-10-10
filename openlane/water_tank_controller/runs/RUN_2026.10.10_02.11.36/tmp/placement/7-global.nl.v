module water_tank_controller (alarm,
    clk,
    dry_run_fault,
    level_full,
    level_low,
    pump_en,
    rst_n);
 output alarm;
 input clk;
 input dry_run_fault;
 input level_full;
 input level_low;
 output pump_en;
 input rst_n;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire \state[0] ;
 wire \state[1] ;
 wire \state[2] ;

 sky130_fd_sc_hd__a21oi_2 _09_ (.A1(level_low),
    .A2(level_full),
    .B1(dry_run_fault),
    .Y(_03_));
 sky130_fd_sc_hd__inv_2 _10_ (.A(_03_),
    .Y(alarm));
 sky130_fd_sc_hd__inv_2 _11_ (.A(level_full),
    .Y(_04_));
 sky130_fd_sc_hd__o21a_2 _12_ (.A1(\state[1] ),
    .A2(\state[0] ),
    .B1(level_low),
    .X(_05_));
 sky130_fd_sc_hd__a21oi_2 _13_ (.A1(_04_),
    .A2(\state[2] ),
    .B1(_05_),
    .Y(_06_));
 sky130_fd_sc_hd__nor2_2 _14_ (.A(alarm),
    .B(_06_),
    .Y(_02_));
 sky130_fd_sc_hd__a21oi_2 _15_ (.A1(_04_),
    .A2(\state[1] ),
    .B1(\state[0] ),
    .Y(_07_));
 sky130_fd_sc_hd__o21ai_2 _16_ (.A1(level_low),
    .A2(_07_),
    .B1(_03_),
    .Y(_00_));
 sky130_fd_sc_hd__o211a_2 _17_ (.A1(\state[1] ),
    .A2(\state[2] ),
    .B1(_03_),
    .C1(level_full),
    .X(_01_));
 sky130_fd_sc_hd__and2_2 _18_ (.A(\state[2] ),
    .B(_03_),
    .X(_08_));
 sky130_fd_sc_hd__buf_1 _19_ (.A(_08_),
    .X(pump_en));
 sky130_fd_sc_hd__dfstp_2 _20_ (.CLK(clk),
    .D(_00_),
    .SET_B(rst_n),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_2 _21_ (.CLK(clk),
    .D(_01_),
    .RESET_B(rst_n),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_2 _22_ (.CLK(clk),
    .D(_02_),
    .RESET_B(rst_n),
    .Q(\state[2] ));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 ();
endmodule
