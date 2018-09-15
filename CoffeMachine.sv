//selcoffe: selecciona el cafe que se quiere tomar
//activatemachine: activa la maquina de cafe
//cancel: retorna el dinero ingresado
//reset: devuelve la maquina al estado inicial despues de ser usada
//       esto puede ser tomado como que el cliente tomo el vuelto
//coin: el tipo de moneda ingresada es 100 o 500 (0->100, 1->500)
//insertCoin: inserta la moneda en la en la maquina
//clk: el reloj
//served outputs: indican si el paso de la maquina fue hecho 

module CoffeMachine (input logic selcoffe, activatemachine, cancel, reset, coin,insertCoin, clk, 
		output logic WaterServed, CoffeServed, MilkServed, ChocolateServed, SugarServed,Done, 
		output logic [6:0] change_out,coffe_type_out,money_out, output logic clockout);

	logic clkout, start, enoughmoney;
	
	logic [1:0] coffeType; 
	logic [3:0] costo;
	logic [3:0] money;
	logic [3:0] change;
	
	
	assign clkout = clk;
	
	TimeDivider1Seg _1segdiv(clk, reset, clkout);
	
	assign clockout = clkout;
	
	
	
	obtenerCosto _obtcost(coffeType, costo);
	
	
	calcularVuelto _change(money, costo, change, enoughmoney);
	
	sumarDinero _addmoney(coin, insertCoin, reset, money);
	
	
	
	guardarInstruccion _guardarins(selcoffe, reset, coffeType);
	
	assign start = activatemachine;// & enoughmoney;
	
	
	CoffePreparationStateMachine _coffe_prep_state_mach(clkout, reset, start, coffeType,
												 WaterServed, CoffeServed,
												 MilkServed, ChocolateServed, SugarServed,Done);

	
	sevenSegments(costo,change_out);
	sevenSegments(money,money_out);
	
	sevenSegments({2'b00,coffeType},coffe_type_out);

endmodule
