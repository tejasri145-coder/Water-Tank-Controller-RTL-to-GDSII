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
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;

 sky130_fd_sc_hd__a21oi_2 _09_ (.A1(net3),
    .A2(net2),
    .B1(net1),
    .Y(_03_));
 sky130_fd_sc_hd__inv_2 _10_ (.A(_03_),
    .Y(net5));
 sky130_fd_sc_hd__inv_2 _11_ (.A(net2),
    .Y(_04_));
 sky130_fd_sc_hd__o21a_1 _12_ (.A1(\state[1] ),
    .A2(\state[0] ),
    .B1(net3),
    .X(_05_));
 sky130_fd_sc_hd__a21oi_1 _13_ (.A1(_04_),
    .A2(\state[2] ),
    .B1(_05_),
    .Y(_06_));
 sky130_fd_sc_hd__nor2_1 _14_ (.A(net5),
    .B(_06_),
    .Y(_02_));
 sky130_fd_sc_hd__a21oi_1 _15_ (.A1(_04_),
    .A2(\state[1] ),
    .B1(\state[0] ),
    .Y(_07_));
 sky130_fd_sc_hd__o21ai_1 _16_ (.A1(net3),
    .A2(_07_),
    .B1(_03_),
    .Y(_00_));
 sky130_fd_sc_hd__o211a_1 _17_ (.A1(\state[1] ),
    .A2(\state[2] ),
    .B1(_03_),
    .C1(net2),
    .X(_01_));
 sky130_fd_sc_hd__and2_1 _18_ (.A(\state[2] ),
    .B(_03_),
    .X(_08_));
 sky130_fd_sc_hd__clkbuf_1 _19_ (.A(_08_),
    .X(net6));
 sky130_fd_sc_hd__dfstp_1 _20_ (.CLK(clk),
    .D(_00_),
    .SET_B(net4),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_1 _21_ (.CLK(clk),
    .D(_01_),
    .RESET_B(net4),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _22_ (.CLK(clk),
    .D(_02_),
    .RESET_B(net4),
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
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(dry_run_fault),
    .X(net1));
 sky130_fd_sc_hd__dlymetal6s2s_1 input2 (.A(level_full),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(level_low),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(rst_n),
    .X(net4));
 sky130_fd_sc_hd__buf_2 output5 (.A(net5),
    .X(alarm));
 sky130_fd_sc_hd__clkbuf_4 output6 (.A(net6),
    .X(pump_en));
endmodule
