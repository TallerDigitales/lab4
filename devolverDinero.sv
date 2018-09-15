module devolverDinero(input logic [3:0] vuelto, input logic activador, output logic[3:0] dinero);
	logic[3:0] zero;
	
	assign zero = 4'b0000;
	
	Muxr #(4) selDevolver (vuelto, zero, activador, dinero);
endmodule
