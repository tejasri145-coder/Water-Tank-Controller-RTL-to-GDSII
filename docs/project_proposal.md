# Project Proposal

## Project Title
Automatic Water Tank Level Monitoring and Pump Control System
RTL-to-GDSII Implementation Using Verilog HDL

## Problem Statement
Water overflow and unsafe pump operation can waste water and
damage pumping equipment. This project implements a compact
digital controller to control a pump-enable signal based on
water-level and safety-fault inputs.

## Main Function
Monitor water-level signals and generate pump-control and alarm
outputs according to predefined safety rules.

## Inputs
- clk: System clock
- rst_n: Active-low reset
- level_low: Indicates low water level
- level_full: Indicates the tank is full
- dry_run_fault: Indicates unsafe pump operation

## Outputs
- pump_en: Pump-driver enable signal
- alarm: Fault indication

## Sequential Logic
- Finite State Machine (FSM)
- State registers
- Optional counters if sensor filtering is required

## Operating Rules
- Low level: Pump ON
- Intermediate level: Retain the previous pump state
- Full level: Pump OFF
- Dry-run fault: Pump OFF and alarm ON
- Invalid sensor combination: Pump OFF and alarm ON
- Reset: Pump OFF and alarm OFF

## Verification Plan
Test reset, low level, intermediate level, full level, dry-run
fault, invalid sensor combinations, and successive level changes.

## Physical Design
Simulate and synthesize the RTL, perform physical design using
OpenLane and Sky130, inspect the final GDSII in KLayout, and
review available timing and physical verification reports.
