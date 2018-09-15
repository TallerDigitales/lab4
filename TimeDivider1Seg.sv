//clk is a 50Mhz
module TimeDivider1Seg (input logic clk, reset, output logic clkout);

	logic [31:0] data;
	logic reset_counter;
	counter #(32) _counter(clk, reset_counter | reset, data);
	
	//25 000 000 tics
	assign reset_counter = data == 32'b00000000000000000111100001000000 | reset;
	
	
	

	always_ff @(posedge clk)
	begin
		if (reset) clkout <= 1;
		else if (reset_counter) clkout  <= ~clkout;
	end

endmodule
