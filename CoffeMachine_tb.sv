
module CoffeMachine_tb ();

	logic selcoffe, activatemachine, cancel, reset, coin,insertCoin, clk;
	logic WaterServed, CoffeServed, MilkServed, ChocolateServed, SugarServed,Done;
	logic [5:0] change;
	
	CoffeMachine _cm(selcoffe, activatemachine, cancel, reset, coin,insertCoin, clk, 
		WaterServed, CoffeServed, MilkServed, ChocolateServed, SugarServed,Done, 
		change);
		
		
	always
	begin
		clk = 1;
		#5;
		clk = 0;
		#5;
	end
	
	initial 
	begin
		reset = 1;
		#10
		reset = 0;
		#10
		coin = 1;
		insertCoin = 1;
		#10
		#10
		coin = 1;
		insertCoin = 0;
		#10
		insertCoin = 1;
		#10
		insertCoin = 0;
		#10;
		
	
	end
		
endmodule

