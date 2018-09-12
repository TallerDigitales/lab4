module sumarDinero(input logic moneda, rst, input logic [5:0] dineroActual, output logic[5:0] dineroTotal);
	

logic [5:0] identificada;
case (moneda)
	1'b0 : begin
	assign identificada = 6'b000001;
	end
	1'b1 : begin
	assign identificada = 6'b000101;
	end
	default: begin
	assign identificada = 6'b000000;
	end
endcase

if (rst)
	assign identificada = 6'b000000;
	assign dineroActual = 6'b000000;


logic cout;

sumador #(6) adder (dineroActual, identificada, 1'b0,  dineroTotal, cout);

endmodule
