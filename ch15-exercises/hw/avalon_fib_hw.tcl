# TCL File Generated by Component Editor 13.0sp1
# Sat Sep 21 13:39:11 EDT 2019
# DO NOT MODIFY


# 
# avalon_fib "avalon_fib" v1.0
#  2019.09.21.13:39:11
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module avalon_fib
# 
set_module_property DESCRIPTION ""
set_module_property NAME avalon_fib
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME avalon_fib
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_fib
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file avalon_fib.v VERILOG PATH avalon_fib.v TOP_LEVEL_FILE
add_fileset_file fib.v VERILOG PATH fib.v


# 
# parameters
# 


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
set_interface_property reset associatedClock ""
set_interface_property reset synchronousEdges NONE
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point fib_cpu
# 
add_interface fib_cpu avalon end
set_interface_property fib_cpu addressUnits WORDS
set_interface_property fib_cpu associatedClock clock
set_interface_property fib_cpu associatedReset reset
set_interface_property fib_cpu bitsPerSymbol 8
set_interface_property fib_cpu burstOnBurstBoundariesOnly false
set_interface_property fib_cpu burstcountUnits WORDS
set_interface_property fib_cpu explicitAddressSpan 0
set_interface_property fib_cpu holdTime 0
set_interface_property fib_cpu linewrapBursts false
set_interface_property fib_cpu maximumPendingReadTransactions 0
set_interface_property fib_cpu readLatency 0
set_interface_property fib_cpu readWaitStates 0
set_interface_property fib_cpu readWaitTime 0
set_interface_property fib_cpu setupTime 0
set_interface_property fib_cpu timingUnits Cycles
set_interface_property fib_cpu writeWaitTime 0
set_interface_property fib_cpu ENABLED true
set_interface_property fib_cpu EXPORT_OF ""
set_interface_property fib_cpu PORT_NAME_MAP ""
set_interface_property fib_cpu SVD_ADDRESS_GROUP ""

add_interface_port fib_cpu fib_address address Input 1
add_interface_port fib_cpu fib_byteenable byteenable Input 8
add_interface_port fib_cpu fib_chipselect chipselect Input 1
add_interface_port fib_cpu fib_write write Input 1
add_interface_port fib_cpu fib_writedata writedata Input 64
add_interface_port fib_cpu fib_readdata readdata Output 64
set_interface_assignment fib_cpu embeddedsw.configuration.isFlash 0
set_interface_assignment fib_cpu embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment fib_cpu embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment fib_cpu embeddedsw.configuration.isPrintableDevice 0

