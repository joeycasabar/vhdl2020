# Needed packages
- yosys (for synthesyzing the Verilog/VHDL)
- nextpnr-ice40 (for generating the bitstream)
- fpga-icestorm (for interacting with the FPGA)


input files
- Go_Board_Constraints.pcf

start with the Verilog .v files

- Project_7_Segment_top.v
- Binary_To_7Segment.v
- Debounce_Switch.v

generate a .json from the Verilog .v files using yosys
`yosys -p 'synth_ice40 -top Project_7_Segment_Top -json example7.json' Project_7_Segment_Top.v Binary_To_7Segment.v Debounce_Switch.v`

- *The `top` argument is the same as the name of the top-level module*
- *Additional modules should be included along with the top-level module*

make the ASCII .asc from the json?
`nextpnr-ice40 --hx1k --package vq100 --pcf constraints/Go_Board_Constraints.pcf --json example7.json --asc example7.asc`

(I only got it to work using the GUI and saved the .asc)
`nextpnr-ice40 --gui`

turn the ASCII .asc into a bitstream .bin
`icepack example7.asc example7.bin`

get the device info (need Bus # and Device #)
`lsusb`

program the FPGA (using bus and device IDs from previous)
`iceprog -d d:003/004 example7.bin`
