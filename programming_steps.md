# Generating a bitstream from Verilog using open source tools 

## Making the bitstream file

First, install the necessary packages:
- yosys (for synthesyzing the Verilog/VHDL)
- nextpnr-ice40 (for generating the bitstream)
- fpga-icestorm (for interacting with the FPGA)


Prepare any constraint files:
- Go_Board_Constraints.pcf

Write your Verilog .v files:

- Project_7_Segment_top.v
- Binary_To_7Segment.v
- Debounce_Switch.v

Then, generate a .json from the Verilog .v files using `yosys`: 
`yosys -p 'synth_ice40 -top Project_7_Segment_Top -json example7.json' Project_7_Segment_Top.v Binary_To_7Segment.v Debounce_Switch.v`

- *The `top` argument is the same as the name of the top-level module*
- *Additional modules should be included along with the top-level module*

Next, we need to make the ASCII .asc from the json we prepared earlier using `nextpnr-ice40`: 
`nextpnr-ice40 --hx1k --package vq100 --pcf constraints/Go_Board_Constraints.pcf --json example7.json --asc example7.asc`

Alternatively, you can do this using the GUI: 
`nextpnr-ice40 --gui`

Finally, we turn the ASCII .asc into a bitstream .bin using `icepack`:
`icepack example7.asc example7.bin`

## Programming the FPGA

Start by getting the device info (we need Bus # and Device #):
`lsusb`

Then we can flash the bitstream to the board (using bus and device IDs from previous)
`iceprog -d d:003/004 example7.bin`
