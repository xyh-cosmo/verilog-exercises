# TCL File Generated by Component Editor 13.0sp1
# Wed Oct 09 16:03:27 EDT 2019
# DO NOT MODIFY


# 
# avalon_ps2 "avalon_ps2" v1.0
#  2019.10.09.16:03:27
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module avalon_ps2
# 
set_module_property DESCRIPTION ""
set_module_property NAME avalon_ps2
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME avalon_ps2
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_ps2
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file avalon_ps2.v VERILOG PATH avalon_ps2.v TOP_LEVEL_FILE
add_fileset_file avalon_ps2_hw.tcl OTHER PATH avalon_ps2_hw.tcl
add_fileset_file fifo.v VERILOG PATH fifo.v
add_fileset_file fifo_ctrl.v VERILOG PATH fifo_ctrl.v
add_fileset_file ps2_rx.v VERILOG PATH ps2_rx.v
add_fileset_file ps2_tx.v VERILOG PATH ps2_tx.v
add_fileset_file ps2_tx_rx_buf.v VERILOG PATH ps2_tx_rx_buf.v
add_fileset_file reg_file.v VERILOG PATH reg_file.v


# 
# parameters
# 
add_parameter W_SIZE INTEGER 2
set_parameter_property W_SIZE DEFAULT_VALUE 2
set_parameter_property W_SIZE DISPLAY_NAME W_SIZE
set_parameter_property W_SIZE TYPE INTEGER
set_parameter_property W_SIZE UNITS None
set_parameter_property W_SIZE HDL_PARAMETER true


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point cpu_ps2
# 
add_interface cpu_ps2 avalon end
set_interface_property cpu_ps2 addressUnits WORDS
set_interface_property cpu_ps2 associatedClock clock
set_interface_property cpu_ps2 associatedReset reset
set_interface_property cpu_ps2 bitsPerSymbol 8
set_interface_property cpu_ps2 burstOnBurstBoundariesOnly false
set_interface_property cpu_ps2 burstcountUnits WORDS
set_interface_property cpu_ps2 explicitAddressSpan 0
set_interface_property cpu_ps2 holdTime 0
set_interface_property cpu_ps2 linewrapBursts false
set_interface_property cpu_ps2 maximumPendingReadTransactions 0
set_interface_property cpu_ps2 readLatency 0
set_interface_property cpu_ps2 readWaitStates 0
set_interface_property cpu_ps2 readWaitTime 0
set_interface_property cpu_ps2 setupTime 0
set_interface_property cpu_ps2 timingUnits Cycles
set_interface_property cpu_ps2 writeWaitTime 0
set_interface_property cpu_ps2 ENABLED true
set_interface_property cpu_ps2 EXPORT_OF ""
set_interface_property cpu_ps2 PORT_NAME_MAP ""
set_interface_property cpu_ps2 SVD_ADDRESS_GROUP ""

add_interface_port cpu_ps2 ps2_address address Input 2
add_interface_port cpu_ps2 ps2_chipselect chipselect Input 1
add_interface_port cpu_ps2 ps2_write write Input 1
add_interface_port cpu_ps2 ps2_writedata writedata Input 32
add_interface_port cpu_ps2 ps2_readdata readdata Output 32
set_interface_assignment cpu_ps2 embeddedsw.configuration.isFlash 0
set_interface_assignment cpu_ps2 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment cpu_ps2 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment cpu_ps2 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point ps2_phys
# 
add_interface ps2_phys conduit end
set_interface_property ps2_phys associatedClock clock
set_interface_property ps2_phys associatedReset reset
set_interface_property ps2_phys ENABLED true
set_interface_property ps2_phys EXPORT_OF ""
set_interface_property ps2_phys PORT_NAME_MAP ""
set_interface_property ps2_phys SVD_ADDRESS_GROUP ""

add_interface_port ps2_phys ps2d export Bidir 1
add_interface_port ps2_phys ps2c export Bidir 1

