module weight_mem #(parameter numWeight = 5,adressWidth = 4,dataWidth = 32,weightFile = "weight_n1.mem")
( input clk,
  input ren,
  input [adressWidth -1:0] radd,
  output reg [dataWidth-1:0] wout
);
/*
mem stores the weight values
*/
reg [numWeight-1:0] mem [numWeight-1:0];
initial
begin
	$readmemb(weightFile,mem);
	wout<=0;
end
	
	
	
	always @(posedge clk)
	begin
		if(ren)
		wout <= mem[radd];
		//hardwiring
		else
		wout <=0;
	end
		

endmodule
