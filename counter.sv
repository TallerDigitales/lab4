module counter #(parameter bus = 4)
	(input logic clk,input logic reset, output logic[bus-1:0] q);
	logic[bus-1:0] d;
	logic carryout,cin;
	assign cin = 1;
	adder #(bus) _adder(d,0,cin,q,carryout);
	always_ff@(posedge clk)
		begin
			if(q[bus-1:0] === 'X || reset) 
					d[bus-1:0] <= '1;
			else if (carryout)
					d[bus-1:0] <= '0;
			else 
					d <= q;
		end
endmodule
