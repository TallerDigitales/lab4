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
		output WaterServed, CoffeServed, MilkServed, ChocolateServed, SugarServed,Done, 
		output logic [5:0] change);

	logic clkout, start, enoughmoney;
	
	logic [1:0] coffeType; 
	logic [5:0] costo;
	
	
	logic[5:0] money;
	
	
	assign clkout = clk;
	
	//TimeDivider1Seg _1segdiv(clk, ~Done, clkout);
	
	
	obtenerCosto(coffeType, costo);
	
	
	
	calcularVuelto _change(money, costo, change, enoughmoney);
	
	sumarDinero _addmoney(coin, insertCoin, reset, money);
	
	
	
	guardarInstruccion _guardarins(selcoffe, reset, coffeType);
	
	assign start = activatemachine & enoughmoney;
	
	CoffePreparationStateMachine _coffe_machine(clkout, reset, start, coffeType,
												 WaterServed, CoffeServed,
												 MilkServed, ChocolateServed, SugarServed,Done);
	


endmodule
