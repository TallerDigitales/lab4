module sumarDinero(input logic moneda, rst, input logic [5:0] dineroActual, output logic[5:0] dineroTotal);
	
	
	logic [5:0] actual, identificada;
	
	logic cout;


	sumador #(6) adder (actual, identificada, 1'b0,  dineroTotal, cout);
	
	always
	begin
	if (moneda == 1'b0)
		assign actual = dineroActual;
		assign identificada = 6'b000001;
	if (moneda == 1'b1)
		assign actual = dineroActual;
		assign identificada = 6'b000101;

	if (rst)
		assign identificada = 6'b000000;
		assign actual = 6'b000000;
	end


endmodule
