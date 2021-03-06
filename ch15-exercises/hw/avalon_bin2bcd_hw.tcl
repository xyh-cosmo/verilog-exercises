# TCL File Generated by Component Editor 13.0sp1
# Sun Sep 22 20:27:21 EDT 2019
# DO NOT MODIFY


# 
# avalon_bin2bcd "avalon_bin2bcd" v1.0
#  2019.09.22.20:27:21
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module avalon_bin2bcd
# 
set_module_property DESCRIPTION ""
set_module_property NAME avalon_bin2bcd
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME avalon_bin2bcd
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_bin2bcd
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file avalon_bin2bcd.v VERILOG PATH avalon_bin2bcd.v TOP_LEVEL_FILE
add_fileset_file bin2bcd.v VERILOG PATH bin2bcd.v


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
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point bin2bcd_cpu
# 
add_interface bin2bcd_cpu avalon end
set_interface_property bin2bcd_cpu addressUnits WORDS
set_interface_property bin2bcd_cpu associatedClock clock
set_interface_property bin2bcd_cpu associatedReset reset
set_interface_property bin2bcd_cpu bitsPerSymbol 8
set_interface_property bin2bcd_cpu burstOnBurstBoundariesOnly false
set_interface_property bin2bcd_cpu burstcountUnits WORDS
set_interface_property bin2bcd_cpu explicitAddressSpan 0
set_interface_property bin2bcd_cpu holdTime 0
set_interface_property bin2bcd_cpu linewrapBursts false
set_interface_property bin2bcd_cpu maximumPendingReadTransactions 0
set_interface_property bin2bcd_cpu readLatency 0
set_interface_property bin2bcd_cpu readWaitStates 0
set_interface_property bin2bcd_cpu readWaitTime 0
set_interface_property bin2bcd_cpu setupTime 0
set_interface_property bin2bcd_cpu timingUnits Cycles
set_interface_property bin2bcd_cpu writeWaitTime 0
set_interface_property bin2bcd_cpu ENABLED true
set_interface_property bin2bcd_cpu EXPORT_OF ""
set_interface_property bin2bcd_cpu PORT_NAME_MAP ""
set_interface_property bin2bcd_cpu SVD_ADDRESS_GROUP ""

add_interface_port bin2bcd_cpu write write Input 1
add_interface_port bin2bcd_cpu write_data writedata Input 32
add_interface_port bin2bcd_cpu read_data readdata Output 32
set_interface_assignment bin2bcd_cpu embeddedsw.configuration.isFlash 0
set_interface_assignment bin2bcd_cpu embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment bin2bcd_cpu embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment bin2bcd_cpu embeddedsw.configuration.isPrintableDevice 0


# 
# connection point bin2bcd_itr
# 
add_interface bin2bcd_itr interrupt end
set_interface_property bin2bcd_itr associatedAddressablePoint bin2bcd_cpu
set_interface_property bin2bcd_itr associatedClock clock
set_interface_property bin2bcd_itr associatedReset reset
set_interface_property bin2bcd_itr ENABLED true
set_interface_property bin2bcd_itr EXPORT_OF ""
set_interface_property bin2bcd_itr PORT_NAME_MAP ""
set_interface_property bin2bcd_itr SVD_ADDRESS_GROUP ""

add_interface_port bin2bcd_itr irq irq Output 1


# 
# connection point bcd
# 
add_interface bcd conduit end
set_interface_property bcd associatedClock clock
set_interface_property bcd associatedReset reset
set_interface_property bcd ENABLED true
set_interface_property bcd EXPORT_OF ""
set_interface_property bcd PORT_NAME_MAP ""
set_interface_property bcd SVD_ADDRESS_GROUP ""

add_interface_port bcd bcd export Output 16

