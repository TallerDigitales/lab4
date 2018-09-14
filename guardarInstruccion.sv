module guardarInstruccion(input logic selecCafe, input logic rst, output logic [1:0] instruction);
	
	counter #(2) _counter(selecCafe,rst, instruction);
	
	//adder #(2) sumador(instruccionActual, 2'b01, 1'b0, instrucIntermedia, cout);
/*
	always @(posedge selecCafe)
	begin
	if (rst)
		begin
			instruccionActual <= 2'b00;
			instruccionSiguiente <= 2'b00;
		end
	else
		instruccionSiguiente <= instruccionActual + 1;	
	end
*/
endmodule
