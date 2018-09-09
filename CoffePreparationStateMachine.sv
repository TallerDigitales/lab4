module CoffePreparationStateMachine (input logic clk, reset, start,
												 input logic [1:0] coffeType,
												 output 
												 WaterServed,
												 CoffeServed,
												 MilkServed,
												 ChocolateServed,
												 SugarServed,
												 Done
												 );											 
	//Cafe expreso: 		00
	//Cafe con leche:		01
	//Capuccino:			10
	//Mocaccino:			11
	logic isExpresso, isCoffeWithMilk, isCapuccino, isMocaccino;											 
	typedef enum logic [3:0] { 
		Waiting, 
		Water1, Water2,
		Coffe1, Coffe2, Coffe3, 
		Milk1, Milk2, 
		Chocolate1, Chocolate2, 
		Sugar, 
		Prepared
	} state;
	
	state currentState,nextState;
	
	assign counterReset = currentState != nextState;
	assign isExpresso = ~coffeType[0] & ~coffeType[1];
	assign isCoffeWithMilk = coffeType[0] & ~coffeType[1];
	assign isCapuccino = ~coffeType[0] & coffeType[1];
	assign isMocaccino = coffeType[0] & coffeType[1];
	
	
	
	always_ff @(posedge clk)currentState <= nextState;
	
	always_comb
		case (currentState)
			Waiting:
				if (start)begin
					if (isMocaccino) nextState = Water2;
					else nextState = Water1;
				end
				else nextState = Waiting;
			Water1:
				nextState = Water2;
			Water2:
				if (isExpresso) nextState = Coffe1;
				else if (isCoffeWithMilk) nextState = Coffe2;
				else nextState = Coffe3;
			Coffe1:
				nextState = Coffe2;
			Coffe2:
				nextState = Coffe3;
			Coffe3:
				if (isExpresso) nextState = Sugar;
				else if (isCapuccino) nextState = Milk1;
				else nextState = Milk2;
			Milk1:
				nextState = Milk2;
			Milk2:
				if (isMocaccino) nextState = Chocolate1;
				else nextState = Sugar;
			Chocolate1:
				nextState = Chocolate2;
			Chocolate2:
				nextState = Sugar;
			Sugar:
				nextState = Prepared;
			Prepared:
				if (reset) nextState = Waiting;
				else nextState = Prepared;
			default:
				nextState = Waiting;
		endcase
		
		
		
		assign SugarServed = currentState == Prepared;
		assign ChocolateServed = currentState == Sugar | SugarServed;
		assign MilkServed =  currentState == Chocolate1 | currentState == Chocolate2 |currentState == Sugar | ChocolateServed;
		assign CoffeServed = currentState == Milk1 | currentState == Milk2 | currentState == Sugar | MilkServed ;
		assign WaterServed = currentState == Coffe1 | currentState == Coffe2 | currentState == Coffe3 | CoffeServed;		
		assign Done = SugarServed;		
		
	endmodule
	