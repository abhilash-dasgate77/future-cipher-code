# future-hw-code
The repository contains verilog code for FUTURE block cipher.

Anyone who implements FUTURE cipher in a FPGA board can use this code. The user needs to integrate counter.v (144 clocks) and full_cir.v (16-bit) to get roundwise output.

# How to run

Every module has a testbench allowing the user to debug an error. Copy all the files with extension (.v) into your newly created project and set the full_cir.v as the main project in the "implementation" tab.

# Simulation in ISE verilog

In the "simulation" tab, select full_cir_tb.v, then Behavioural Check Syntax followed by Simulate Behavioural Model.

# Microcontroller PIC18F25K22

The repository has 2 files i.e. (1) main.c (2) config.h

# Register Switchings simulation

Please have a look at the jupyter notebook power_analysis.pynb in the repository.
