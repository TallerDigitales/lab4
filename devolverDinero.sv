module devolverDinero(input logic [5:0] vuelto, input logic activador, output logic[5:0] dinero);
	logic[5:0] zero;
	
	assign zero = 6'b000000
	
	Muxr #(6) selDevolver (vuelto, zero, activador, dinero);
endmodule
