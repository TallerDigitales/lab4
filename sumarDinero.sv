module sumarDinero(input logic moneda, allowToAdd, rst, output logic[5:0] dineroTotal);
	
	logic [5:0] actual, identificada;
	
	logic cout;

	adder #(6) _adder (actual, identificada, 1'b0,  dineroTotal, cout);
	
	always_ff @(posedge allowToAdd)
	begin
		if (rst) 
			begin
				actual <= 6'b000000;
				identificada <= 6'b000000;
			end
		else if (moneda == 1'b0)
			begin
				identificada <= 6'b000001;
				actual <= dineroTotal;
			end
		else if (moneda == 1'b1)
			begin
				identificada <= 6'b000101;
				actual <= dineroTotal;
			end
	end

endmodule
