module calcularVuelto (input logic [5:0] dinero, costo, output logic [5:0] vuelto, output logic suficienteDinero);
	logic cin;
	
	logic [5:0] c1Costo;
	assign c1Costo = ~ costo;
	assign cin = 1'b1;
	
	logic negativo;
	adder #(6) _adder (dinero, c1Costo, cin, vuelto, negativo);
	
	assign suficienteDinero = ~negativo;


endmodule
