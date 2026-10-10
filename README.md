# Water Tank Controller — RTL to GDSII using OpenLane and Sky130

## Overview

This project implements a Water Tank Controller as a sequential digital design in Verilog and takes the design through a complete RTL-to-GDSII physical-design flow using OpenLane v1.0.2 and the Sky130 technology.

Unlike a purely combinational design, the Water Tank Controller is a clocked sequential circuit, making clock-aware timing analysis and CTS-related physical-design stages applicable.

## Function

The Water Tank Controller monitors water-level status and dry-run fault conditions to control pump operation and an alarm output.

The controller uses a clock-driven sequential process to control the pump-enable and alarm signals.

The water tank control logic monitors the water-level inputs and dry-run fault condition and determines the appropriate pump-control response.

## Design

Main design elements:

- Clock input
- Reset/control logic
- Low water-level input
- Full-tank input
- Dry-run fault input
- Pump-enable output
- Alarm output

The Water Tank Controller is a sequential and clocked design.

## RTL-to-GDSII Flow

Verilog RTL → RTL Simulation → Synthesis → Floorplanning → IO Placement → Power Planning → Placement → Clock/CTS Analysis → Routing → Timing → DRC/LVS → GDSII

## Verification

RTL simulation is performed using the Verilog testbench.

The Water Tank Controller functionality is verified through simulation and the generated waveform is inspected using GTKWave.

The project includes:

- Water Tank Controller RTL source
- Verilog testbench
- Simulation results
- Generated VCD waveform
- GTKWave waveform verification

The RTL simulation and waveform evidence are stored in the "screenshots/" directory.

## Physical Design Results

Metric| Result
Standard cells| 14
Total cell area| 157.6512 µm²
Minimum RC TNS| 0.00
Minimum RC WNS| 0.00
Minimum RC worst setup slack| 10.07 ns
Minimum RC worst hold slack| 0.13 ns
Maximum RC worst setup slack| 10.03 ns
Maximum RC worst hold slack| 0.14 ns
Nominal RC worst setup slack| 10.05 ns
Nominal RC worst hold slack| 0.14 ns
Extracted total power| 4.75 × 10⁻⁵ to 4.81 × 10⁻⁵ W
CTS slew violations| 0
CTS fanout violations| 0
CTS capacitance violations| 0
DRC violations| Not verified
LVS errors| Not verified
XOR differences| Not verified

## Static Timing Analysis

Static Timing Analysis was performed for the clocked Water Tank Controller.

Detailed timing reports were generated for multiple operating corners.

The project contains:

- Maximum-corner STA reports
- Minimum-corner STA reports
- Nominal-corner STA reports
- Detailed RC-extracted timing reports
- Setup and hold timing reports
- Combined all-corner STA report

The complete combined STA report is available as:

"docs/STA_All_Corners.pdf"

Additional STA reports are available in "results/sta/".

The final recorded timing results are:

- Minimum RC worst setup slack: 10.07 ns
- Minimum RC worst hold slack: 0.13 ns
- Maximum RC worst setup slack: 10.03 ns
- Maximum RC worst hold slack: 0.14 ns
- Nominal RC worst setup slack: 10.05 ns
- Nominal RC worst hold slack: 0.14 ns
- Minimum RC TNS: 0.00
- Minimum RC WNS: 0.00

## Clocking

This Water Tank Controller is a sequential clocked design.

Therefore:

- A clock is used by the design.
- Clock-aware timing analysis is applicable.
- CTS/clock-related implementation is applicable.
- Setup and hold timing are analyzed.

This is different from the 4-bit ALU project, which was purely combinational.

## Signoff

The final design has a recorded GDSII artifact associated with the OpenLane run.

- DRC: requires confirmation from the signoff report
- LVS: requires confirmation from the signoff report
- XOR: requires confirmation from the matching report
- Antenna: requires confirmation from the antenna report
- Final GDSII: recorded artifact path available
- KLayout GDS: verify file availability
- Final LEF: verify file availability
- Final SPICE: verify file availability
- Final SDF: verify file availability
- Final Liberty: verify file availability
- Final MAG: verify file availability

## Final Files

Important physical-design outputs should be available in "results/final/":

- water_tank_controller.gds
- water_tank_controller.klayout.gds
- water_tank_controller.lef
- water_tank_controller.lib
- water_tank_controller.spice
- water_tank_controller.sdf
- water_tank_controller.mag
- water_tank_controller.rpt

Important signoff reports are available in "results/signoff/".

Important STA reports are available in "results/sta/":

- rcx_max_sta.checks.rpt
- rcx_max_sta.max.rpt
- rcx_max_sta.min.rpt
- rcx_max_sta.power.rpt
- rcx_max_sta.skew.rpt
- rcx_max_sta.summary.rpt
- rcx_min_sta.checks.rpt
- rcx_min_sta.max.rpt
- rcx_min_sta.min.rpt
- rcx_min_sta.power.rpt
- rcx_min_sta.skew.rpt
- rcx_min_sta.summary.rpt
- rcx_nom_sta.checks.rpt
- rcx_nom_sta.max.rpt
- rcx_nom_sta.min.rpt
- rcx_nom_sta.power.rpt
- rcx_nom_sta.skew.rpt
- rcx_nom_sta.summary.rpt
- STA_All_Corners.pdf

## Repository Structure

Water-Tank-Controller-RTL-to-GDSII/

- README.md
- rtl/
- simulation/
- openlane/
- results/
- screenshots/
- docs/

## Screenshots

The "screenshots/" directory contains the main project evidence:

- "water_tank_rtl.png"
- "water_tank_simulation.png"
- "water_tank_waveforms.png"
- "water_tank_layouts.png"

These provide evidence of the RTL design, simulation, waveform verification and final physical layout.

## Tools

- Verilog HDL
- OpenLane v1.0.2
- Sky130 PDK
- Sky130 HD standard-cell library
- GTKWave
- KLayout
- Ubuntu Linux

## Key Learning Outcomes

- Sequential RTL design using Verilog
- Water Tank Controller architecture
- Clocked digital design
- RTL simulation and waveform analysis
- Logic synthesis
- Floorplanning
- IO placement
- Power planning
- Standard-cell placement
- Clock/CTS-related implementation
- Global and detailed routing
- Static timing analysis
- Multi-corner timing analysis
- DRC verification
- LVS verification
- XOR/layout comparison
- GDSII generation
- Physical-design signoff

## Conclusion

The Water Tank Controller project demonstrates a sequential VLSI implementation using Verilog HDL, OpenLane v1.0.2 and the Sky130 technology.

The project includes synthesis results, multi-corner static timing analysis and a recorded final GDSII artifact path.

The available reports record positive setup and hold timing slack across the minimum, maximum and nominal RC corners.

Final DRC, LVS and XOR results must be confirmed from their respective reports before claiming zero violations or errors.

The project provides a portfolio example of a clocked RTL-to-GDSII implementation using an open-source VLSI flow.
