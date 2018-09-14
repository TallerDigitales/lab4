module guardarInstruccion(input logic selecCafe, input logic [1:0] instruccionActual, input logic rst, output logic [1:0] instruccionSiguiente);
	
	logic [1:0] instrucIntermedia;
	logic cout;
	sumador #(2) adder(instruccionActual, 2'b01, 1'b0, instrucIntermedia, cout);

	always 
	begin
	if (rst)
		assign instruccionSiguiente = 2'b00;
	else
		if (selecCafe == 1'b1)
			if (cout == 1'b1)
				assign instruccionSiguiente = 2'b00;
			else
				assign instruccionSiguiente = instrucIntermedia;
		else
			instruccionSiguiente = instruccionActual;
			
	end
endmodule
