module avalon_sram16
	(
		input wire clk, reset,
		
		// Avalon-MM slave interface
		input wire [17:0] address,
		input wire chipselect_n, read_n, write_n,
		input wire [1:0] byteenable_n,
		input wire [15:0] writedata,
		output wire [15:0] readdata,
		output wire readdatavalid_n,
		output wire waitrequest_n,

		// conduit to/from SRAM
		output wire [17:0] sram_addr,
		inout [15:0] sram_dq,
		output sram_ce_n, sram_oe_n, sram_we_n,
		output sram_lb_n, sram_ub_n
	);

	reg [17:0] addr_reg;
	reg [15:0] rdata_reg, wdata_reg;
	reg ce_n_reg, lb_n_reg, ub_n_reg, oe_n_reg, we_n_reg;
	reg wait_reg, valid_n_reg;

	always @(posedge clk, posedge reset)
		if (reset)
			begin
				addr_reg <= 18'b0;
				rdata_reg <= 16'b0;
				wdata_reg <= 16'b0;
				ce_n_reg <= 1'b1;
				lb_n_reg <= 1'b1;
				ub_n_reg <= 1'b1;
				oe_n_reg <= 1'b1;
				we_n_reg <= 1'b1;
				valid_n_reg <= 1'b1;
			end
		else
			begin
				addr_reg <= address;
				wdata_reg <= writedata;
				rdata_reg <= sram_dq;
				ce_n_reg <= chipselect_n;
				lb_n_reg <= byteenable_n[0];
				ub_n_reg <= byteenable_n[1];
				oe_n_reg <= read_n;
				we_n_reg <= write_n;
				valid_n_reg <= oe_n_reg;
			end
			
	// to Avalon interface
	assign readdata = rdata_reg;
	assign readdatavalid_n = valid_n_reg;
	assign waitrequest_n = 1'b1;

	// to SRAM
	assign sram_addr = addr_reg;
	assign sram_ce_n = ce_n_reg;
	assign sram_lb_n = lb_n_reg;
	assign sram_ub_n = ub_n_reg;
	assign sram_oe_n = oe_n_reg;
	assign sram_we_n = we_n_reg;

	// SRAM tristate data bus
	assign sram_dq = (~we_n_reg) ? wdata_reg : 16'bz;
endmodule
