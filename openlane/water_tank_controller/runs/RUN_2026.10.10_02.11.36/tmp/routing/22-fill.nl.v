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
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire net7;
 wire net8;
 wire net9;
 wire net10;

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
    .A2(net7),
    .B1(_05_),
    .Y(_06_));
 sky130_fd_sc_hd__nor2_1 _14_ (.A(net5),
    .B(_06_),
    .Y(_02_));
 sky130_fd_sc_hd__a21oi_1 _15_ (.A1(_04_),
    .A2(\state[1] ),
    .B1(net9),
    .Y(_07_));
 sky130_fd_sc_hd__o21ai_1 _16_ (.A1(net3),
    .A2(net10),
    .B1(_03_),
    .Y(_00_));
 sky130_fd_sc_hd__o211a_1 _17_ (.A1(\state[1] ),
    .A2(net7),
    .B1(_03_),
    .C1(net2),
    .X(_01_));
 sky130_fd_sc_hd__and2_1 _18_ (.A(\state[2] ),
    .B(_03_),
    .X(_08_));
 sky130_fd_sc_hd__clkbuf_1 _19_ (.A(_08_),
    .X(net6));
 sky130_fd_sc_hd__dfstp_1 _20_ (.CLK(clknet_1_0__leaf_clk),
    .D(_00_),
    .SET_B(net4),
    .Q(\state[0] ));
 sky130_fd_sc_hd__dfrtp_1 _21_ (.CLK(clknet_1_0__leaf_clk),
    .D(net8),
    .RESET_B(net4),
    .Q(\state[1] ));
 sky130_fd_sc_hd__dfrtp_1 _22_ (.CLK(clknet_1_1__leaf_clk),
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
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__dlygate4sd3_1 hold1 (.A(\state[2] ),
    .X(net7));
 sky130_fd_sc_hd__dlygate4sd3_1 hold2 (.A(_01_),
    .X(net8));
 sky130_fd_sc_hd__dlygate4sd3_1 hold3 (.A(\state[0] ),
    .X(net9));
 sky130_fd_sc_hd__dlygate4sd3_1 hold4 (.A(_07_),
    .X(net10));
 sky130_ef_sc_hd__decap_12 FILLER_0_0_13 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_25 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_0_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_0_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_1_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_2_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_2_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_2_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_4_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_5_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_6 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_6_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_6_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_47 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_59 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_11 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_31 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_7_40 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_7_54 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_7_78 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_7_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_23 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_80 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_9_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_74 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_9_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_27 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_10_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_68 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_10_80 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_11_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_69 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_12_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_12_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_12_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_6 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_13_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_13_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_13_72 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_13_80 ();
endmodule
