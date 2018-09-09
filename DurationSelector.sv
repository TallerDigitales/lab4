module DurationSelector (input logic [1:0] coffeType, 
		 output logic [1:0] WaterTime, CoffeTime, MilkTime, ChocolateTime, SugarTime);

	//Cafe expreso: 		00
	//Cafe con leche:		01
	//Capuccino:			10
	//Mocaccino:			11
	logic isMocaccino;
	logic [1:0] Zero,One,Two,Three;
	
	assign Zero = 2'b00; assign One = 2'b01; assign Two = 2'b10; assign Three = 2'b11;
	assign isMocaccino = coffeType[0] & coffeType[1];
	
	Muxr #(2) _water(Two,One,isMocaccino,WaterTime);
	Muxr4 #(2) _coffe(Three,Two,One,One,coffeType,CoffeTime);
	Muxr4 #(2) _milk(Zero,One,Two,One,coffeType,MilkTime);
	Muxr #(2) _chocolate(Zero,Two,isMocaccino,ChocolateTime);
	assign SugarTime = 2'b01;
endmodule

