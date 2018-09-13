module calcularVuelto (input logic [5:0] dinero, costo, output logic [5:0] vuelto, output logic suficienteDinero);
	logic c1Costo, cin;
	assign c1Costo = ~ costo;
	assign cin = 1'b1;
	
	logic negativo;
	restador #(6) adder (dinero, c1Costo, cin, vuelto, negativo);
	
	assign suficienteDinero = ~negativo;


endmodule
