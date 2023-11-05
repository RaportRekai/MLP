module bias_memory #(parameter addressWidth = 17,dataWidth = 34,weightFile = "bias_1.mem")
( input clk,
  input ren,
  input [addressWidth -1:0] radd,
  output reg [dataWidth-1:0] wout
);

reg [dataWidth-1:0] mem[29:0];

	initial
	begin
	$readmemh(weightFile,mem);
	wout <= 0;
	end
	
	always @(posedge clk)
	begin
		if(ren)
		wout = mem[0];
		else
		wout =0;
	end
		

endmodule
