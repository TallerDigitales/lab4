module obtenerCosto(input logic [1:0] tipoCafe, output logic costo[5:0]);
	//Cafe expreso: 		00
	//Cafe con leche:		01
	//Capuccino:			10
	//Mocaccino:			11
	
	logic [5:0] cafeExpresso, cafeConLeche, capuccino, mocaccino;
	assign cafeExpresso = 6'b000011;
	assign cafeConLeche = 6'b000110;
	assign capuchino = 6'b000101;
	assign mocaccino = 6'b000111;
	
	Muxr4 #(6) selCosto (cafeExpresso, cafeConLeche, capuccino, mocaccino, tipoCafe, costo)
	
endmodule
