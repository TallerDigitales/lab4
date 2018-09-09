module GeneralCoffeStateMachine (
									input logic clk, reset, 
									//X: represents if the start button was pressed
									X,
									//W: represents if the cancel button was pressed
									W,
									//M: represents if the coffe was completly made
									M,
									//G: represents if the user gets the money
									G,
									output logic CoffeFlags,
									//H: represents if the change can be returned
									H,
									//R: reset All
									R
									);
									
									
		typedef enum logic [1:0] {
			//State A: waiting for start button get pressed and sufficient money
			A,
			//State B: making coffe
			B,
			//State C: return the enter money
			C,
			//State D: reset all
			D} state;
		
		state currentState,nextState;
		
		
		always_ff @(posedge clk)
			//if (reset) currentState <= A;
			//else 
			currentState <= nextState;
			
		
		always_comb
			case (currentState)
				A:
					if (X) nextState = B;
					else if (W) nextState = C;
					else nextState = A;
				B:
					if (!M) nextState = B;
					else nextState = C;
				
				C:
					if (G) nextState = D;
					else nextState = C;
				D:
					nextState = A;
				default:
					nextState = A;
			endcase
			
			
		assign H = currentState == C | currentState == D;
		assign R = currentState == D;



endmodule

