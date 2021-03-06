module div
	#(
		parameter W = 8,
		          CBIT = $clog2(W) + 1
	)
	(
		input wire iCLK, iRESET,
		input wire iSTART,
		input wire [W-1:0] iDVSR, iDVND,
		output reg oREADY, oDONE,
		output wire [W-1:0] oQUO, oRMD
	);

	// symbolic state declaration
	localparam [1:0]
		idle = 2'b00,
		op   = 2'b01,
		last = 2'b10,
		done = 2'b11;
	
	// signal declaration
	reg [1:0] state_reg, state_next;
	reg [W-1:0] rh_reg, rh_next, rl_reg, rl_next, rh_tmp;
	reg [W-1:0] d_reg, d_next;
	reg [CBIT-1:0] n_reg, n_next;
	reg q_bit;

	// body
	// FSMD state and data registers
	always @(posedge iCLK, posedge iRESET)
		if (iRESET)
			begin
				state_reg <= idle;
				rh_reg <= 0;
				rl_reg <= 0;
				d_reg <= 0;
				n_reg <= 0;
			end
		else
			begin
				state_reg <= state_next;
				rh_reg <= rh_next;
				rl_reg <= rl_next;
				d_reg <= d_next;
				n_reg <= n_next;
			end
	
	always @*
	begin
		state_next = state_reg;
		oREADY = 1'b0;
		oDONE = 1'b0;
		rh_next = rh_reg;
		rl_next = rl_reg;
		d_next = d_reg;
		n_next = n_reg;
		case (state_reg)
			idle:
				begin
					oREADY = 1'b1;
					if (iSTART)
						begin
							rh_next = 0;
							rl_next = iDVND;	// dividend
							d_next = iDVSR;		// divisor
							n_next = W + 1;		// index
							state_next = op;
						end
				end
			op:
				begin
					// shift rh and rl left
					rl_next = {rl_reg[W-2:0], q_bit};
					rh_next = {rh_tmp[W-2:0], rl_reg[W-1]};
					// decrease index
					n_next = n_reg - 1;
					if (n_next == 1)
						state_next = last;
				end
			last:	// last iteration
				begin
					rl_next = {rl_reg[W-2:0], q_bit};
					rh_next = rh_tmp;
					state_next = done;
				end
			done:
				begin
					oDONE = 1'b1;
					state_next = idle;
				end
			default: state_next = idle;
		endcase
	end

	// compare and subtract circuit
	always @*
		if (rh_reg >= d_reg)
			begin
				rh_tmp = rh_reg - d_reg;
				q_bit = 1'b1;
			end
		else
			begin
				rh_tmp = rh_reg;
				q_bit = 1'b0;
			end
	
	// output
	assign oQUO = rl_reg;
	assign oRMD = rh_reg;
endmodule
