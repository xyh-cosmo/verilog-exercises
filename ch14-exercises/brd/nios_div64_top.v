module nios_div64_top
	(
		input wire CLOCK_50,
		output wire [7:0] LEDG,
		output wire [6:0] HEX3, HEX2, HEX1, HEX0,
		output wire [17:0] SRAM_ADDR,
		inout [15:0] SRAM_DQ,
		output SRAM_CE_N, SRAM_OE_N, SRAM_WE_N,
		output SRAM_LB_N, SRAM_UB_N
	);
	
	// signal declaration
	wire [63:0] dvnd, dvsr, quo, rmd;
	wire [31:0] sseg;
	wire start, ready, done;

	// body
	// instantiate nios
	nios_div64 nios_cpu_unit
		(.clk_clk(CLOCK_50),
		 .reset_reset_n(1'b1),
		 .sram_sram_addr_addr(SRAM_ADDR),
		 .sram_sram_addr_ce_n(SRAM_CE_N),
		 .sram_sram_addr_dq(SRAM_DQ),
		 .sram_sram_addr_lb_n(SRAM_LB_N),
		 .sram_sram_addr_oe_n(SRAM_OE_N),
		 .sram_sram_addr_ub_n(SRAM_UB_N),
		 .sram_sram_addr_we_n(SRAM_WE_N),
		 .sseg_external_connection_export(sseg),
		 .start_external_connection_export(start),
		 .dvnd_u_external_connection_export(dvnd[63:32]),
		 .dvnd_l_external_connection_export(dvnd[31:0]),
		 .dvsr_u_external_connection_export(dvsr[63:32]),
		 .dvsr_l_external_connection_export(dvsr[31:0]),
		 .quo_u_external_connection_export(quo[63:32]),
		 .quo_l_external_connection_export(quo[31:0]),
		 .rmd_u_external_connection_export(rmd[63:32]),
		 .rmd_l_external_connection_export(rmd[31:0]),
		 .ready_external_connection_export(ready),
		 .done_external_connection_export(done)
		);

	div #(.W(64)) d_unit
		(.iCLK(CLOCK_50), .iRESET(1'b0), .iSTART(start),
		 .iDVND(dvnd), .iDVSR(dvsr), .oQUO(quo), .oRMD(rmd),
		 .oREADY(ready), .oDONE(done));

	// output assignment
	assign HEX3 = sseg[30:24];
	assign HEX2 = sseg[22:16];
	assign HEX1 = sseg[14:8];
	assign HEX0 = sseg[6:0];
	assign LEDG = rmd[7:0];
endmodule
