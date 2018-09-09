module adder #(bus = 4)
	(input logic[bus-1:0] a,b,input logic cin,
	output logic[bus-1:0] s,output logic carryout);
	
	
	logic[bus:0] cout;
	assign cout[0]  = cin;
	assign carryout = cout[bus];
	genvar i;
	generate 
		for (i = 0; i < bus; i = i+1) begin:forloop
			BitAdder addr(a[i],b[i],cout[i], s[i],cout[i+1]);
		end
	
	endgenerate
	
	
endmodule
