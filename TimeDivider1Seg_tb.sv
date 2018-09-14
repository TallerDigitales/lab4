module TimeDivider1Seg_tb ();
	
	logic clk, reset, clkout;
	TimeDivider1Seg _1segdiv(clk, reset, clkout);

	
	
	always 
	begin
	
	clk = 1; #20ns;
	clk = 0; #20ns;
	
	end
	
	initial 
	begin
	reset = 1;
	#1s
	reset = 0;
	#1s
	if(clkout==0) $display("Error: clkout no deberia ser cero");
	#1s
	if(clkout==1) $display("Error: clkout no deberia ser uno");
	#1s
	if(clkout==0) $display("Error: clkout no deberia ser cero");
	#1s
	if(clkout==1) $display("Error: clkout no deberia ser uno");
	#1s;
	end
	
	
endmodule

