module sumarDinero(input logic moneda, allowToAdd, rst, output logic[3:0] dineroTotal);
	
	logic [3:0] actual, identificada;
	
	logic cout;

	adder #(4) _adder (actual, identificada, 1'b0,  dineroTotal, cout);
	
	always_ff @(posedge allowToAdd)
	begin
		if (rst) 
			begin
				actual <= 4'b0000;
				identificada <= 4'b0000;
			end
		else if (moneda == 1'b0)
			begin
				identificada <= 4'b0001;
				actual <= dineroTotal;
			end
		else if (moneda == 1'b1)
			begin
				identificada <= 4'b0101;
				actual <= dineroTotal;
			end
	end

endmodule
