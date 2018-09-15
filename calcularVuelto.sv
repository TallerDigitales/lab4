module calcularVuelto (input logic [3:0] dinero, costo, output logic [3:0] vuelto, output logic suficienteDinero);
	logic cin;
	
	logic [3:0] c1Costo;
	assign c1Costo = ~ costo;
	assign cin = 1'b1;
	
	logic negativo;
	adder #(4) _adder (dinero, c1Costo, cin, vuelto, negativo);
	
	assign suficienteDinero = ~vuelto[3];


endmodule
