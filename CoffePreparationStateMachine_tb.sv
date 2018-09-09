module CoffePreparationStateMachine_tb ();


	logic clk,reset,start,WaterServed, CoffeServed, MilkServed, 
		ChocolateServed, SugarServed,Done;
	logic [1:0] coffeType;

	CoffePreparationStateMachine _coffe_machine(clk, reset, start, coffeType,
												 WaterServed, CoffeServed,
												 MilkServed, ChocolateServed, SugarServed,Done);	
												 
												 
	always
		begin
			clk = 1; #5;
			clk = 0; #5;
		end
		
	initial
		begin
			//Expresso
			reset = 1;
			start = 0;
			coffeType = 2'b00;
			#10
			start = 1;
			reset = 0;
			#10
			//Water
			#10
			#10
			#10
			if (WaterServed != 1) $display("Error: Water isn't ended");
			//Coffe
			#10
			if (CoffeServed == 1) $display("Error: Coffe was ended");
			#10
			if (CoffeServed == 1) $display("Error: Coffe was ended");
			#10
			if (CoffeServed != 1) $display("Error: Coffe wasn't ended");
			#10
			if (Done != 1) $display("Error: Sugar wasn't ended");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			#10
			if (Done != 1) $display("Error: Coffe isn't prepared");
			
			reset = 1;
			start = 0;
			coffeType = 2'b01;
			#10
			start = 1;
			reset = 0;
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			
			reset = 1;
			start = 0;
			coffeType = 2'b10;
			#10
			start = 1;
			reset = 0;
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			
			reset = 1;
			start = 0;
			coffeType = 2'b11;
			#10
			start = 1;
			reset = 0;
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10
			#10;
			
			
			
			
		end
		
	
endmodule

