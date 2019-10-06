# TCL File Generated by Component Editor 13.0sp1
# Sun Sep 22 11:01:24 EDT 2019
# DO NOT MODIFY


# 
# avalon_sq_gen "avalon_sq_gen" v1.0
#  2019.09.22.11:01:24
# 
# 

# 
# request TCL package from ACDS 13.1
# 
package require -exact qsys 13.1


# 
# module avalon_sq_gen
# 
set_module_property DESCRIPTION ""
set_module_property NAME avalon_sq_gen
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME avalon_sq_gen
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL avalon_sq_gen
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file avalon_sq_gen.v VERILOG PATH ../hw/avalon_sq_gen.v TOP_LEVEL_FILE
add_fileset_file sq_gen.v VERILOG PATH ../hw/sq_gen.v


# 
# parameters
# 
add_parameter MAX_PER INTEGER 50000000
set_parameter_property MAX_PER DEFAULT_VALUE 50000000
set_parameter_property MAX_PER DISPLAY_NAME MAX_PER
set_parameter_property MAX_PER TYPE INTEGER
set_parameter_property MAX_PER UNITS None
set_parameter_property MAX_PER ALLOWED_RANGES -2147483648:2147483647
set_parameter_property MAX_PER HDL_PARAMETER true


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
# connection point sq_gen_cpu
# 
add_interface sq_gen_cpu avalon end
set_interface_property sq_gen_cpu addressUnits WORDS
set_interface_property sq_gen_cpu associatedClock clock
set_interface_property sq_gen_cpu associatedReset reset
set_interface_property sq_gen_cpu bitsPerSymbol 8
set_interface_property sq_gen_cpu burstOnBurstBoundariesOnly false
set_interface_property sq_gen_cpu burstcountUnits WORDS
set_interface_property sq_gen_cpu explicitAddressSpan 0
set_interface_property sq_gen_cpu holdTime 0
set_interface_property sq_gen_cpu linewrapBursts false
set_interface_property sq_gen_cpu maximumPendingReadTransactions 0
set_interface_property sq_gen_cpu readLatency 0
set_interface_property sq_gen_cpu readWaitStates 0
set_interface_property sq_gen_cpu readWaitTime 0
set_interface_property sq_gen_cpu setupTime 0
set_interface_property sq_gen_cpu timingUnits Cycles
set_interface_property sq_gen_cpu writeWaitTime 0
set_interface_property sq_gen_cpu ENABLED true
set_interface_property sq_gen_cpu EXPORT_OF ""
set_interface_property sq_gen_cpu PORT_NAME_MAP ""
set_interface_property sq_gen_cpu SVD_ADDRESS_GROUP ""

add_interface_port sq_gen_cpu writedata writedata Input 32
add_interface_port sq_gen_cpu address address Input 1
add_interface_port sq_gen_cpu write write Input 1
add_interface_port sq_gen_cpu readdata readdata Output 32
set_interface_assignment sq_gen_cpu embeddedsw.configuration.isFlash 0
set_interface_assignment sq_gen_cpu embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment sq_gen_cpu embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment sq_gen_cpu embeddedsw.configuration.isPrintableDevice 0


# 
# connection point sq
# 
add_interface sq conduit end
set_interface_property sq associatedClock clock
set_interface_property sq associatedReset reset
set_interface_property sq ENABLED true
set_interface_property sq EXPORT_OF ""
set_interface_property sq PORT_NAME_MAP ""
set_interface_property sq SVD_ADDRESS_GROUP ""

add_interface_port sq sq export Output 1
