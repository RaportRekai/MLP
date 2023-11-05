
module new_neuron#(parameter out_width=10,numWeight = 40, numBias = 1,in_depth = 17,w_datawidth = 16,b_datawidth = w_datawidth, weightFile ="weight_n1.mem",biasFile = "bias_1.mem")
(input inpt_valid,
input[in_depth-1:0] bias_add,
input clk,
input mult,
input [in_depth-1:0]inpt,
output reg [out_width-1:0]sout
);
/*
issues to solve
[convert all values to binary and limit -----> my estimtion: 8 bits for input, 16 bits for weight out of which 1 bits for sign, 11 bits for fractional part and 4 bits for integer part]
[basically we are multiplying the whole weight with (2^11) ]
how to move to second layer
[take maybe only the first 3 or 4 bits]
*/

/*
bit width of each variable:
1. inpt = in_depth (17)
2. prod(signed) = 2*in_depth (34)
3. sum(signed) = log((2^34-1)*40)(40)(has to be set manually)
4. wout = in_depth (17) 
5. bout = 2*in_depth (34) 
6. prev_sum(signed) = 2*in_depth (34)
7. count = w_depth (6)
8. sout = 2*in_depth (17)
9. w_addr = w_depth (6)
10. 
 
my plan is to create a new variable mult which multiplies the sum with 2^8 to make it of the same denomination
the sigmoid converts the number to 8 bit
*/

wire signed[w_datawidth+in_depth-1:0]prod;
reg  [in_depth-1:0] inpt_delayed;
wire [w_datawidth-1:0]wout;
wire [b_datawidth-1:0] bout;
wire [out_width-1:0]sout_n;

parameter w_depth = $clog2(numWeight);
parameter b_depth = $clog2(numBias);
parameter s_depth = $clog2((2**(w_datawidth+in_depth)-1)*numWeight);
reg signed[s_depth-1:0] prev_sum;
reg signed[s_depth-1:0] sum;

// w_depth and b_depth extracts the bit width of address used for the weight file and bias file

reg[w_depth:0] count;
reg rst;
reg [w_depth-1:0]w_addr;
reg [in_depth-1:0] sout;
reg s_valid;
reg b_valid;
reg w_en = 1;
reg inpt_valid_ctrl;
reg prod_ctrl;
reg sig_en;
wire sig_end;

initial
begin
    sig_en<=0;
    sum <=0;
	w_addr	<= {w_depth{1'b1}};
	count <= 0;
	inpt_valid_ctrl <= 1;   
	inpt_delayed <=0;                               // To keep count of the number of weights used
end
always @(posedge clk)
begin
	if(inpt_valid == 1)
	begin
		w_addr = w_addr + 1;
		inpt_delayed <= inpt;
	end
end
/*
w_en = only if w_en is one, weight is read from the weight file
w_addr = w_add is just the position of the weight in the txt file
wout = The output weight from weight memory(Here we have assumed that the width of input value is the same as the that of wout )
*/	
weight_mem #(.numWeight(numWeight),.adressWidth(w_depth),.dataWidth(w_datawidth),.weightFile(weightFile))m1 (.clk(clk),
	.ren(w_en),
    .radd(w_addr),
	.wout(wout)
	);
/*
b_valid = controls bias reading from file
radd = gives the address of the bias to be read from file
bout = bias output (this is of size 2 times that of input data)
*/
bias_memory #(.addressWidth(b_depth),.dataWidth(b_datawidth),.weightFile(biasFile)) b1 (.clk(clk),
	.ren(b_valid),
    .radd(bias_add),
	.wout(bout)
	);
new_prod #(.in_depth(in_depth),.w_depth(w_datawidth),.a_width(w_datawidth+in_depth-1)) mul1 //note here the data bus size of weight is assume to be same as that of input
(
.ctrl(prod_ctrl),
.clk(clk),
.a(inpt_delayed),
.b(wout),
.prod(prod)
);

sigmoid#(.s_width(s_depth),.in_width(in_depth)) s1
(
     .clk(clk),
     .sig_en(sig_en),
	 .x(sum),
	 .sig(sout_n),
	 .sig_end(sig_end)
	 );

	
always @(posedge clk)
begin

	if(inpt_valid == 1 && count <= numWeight+1)
	begin
	    prod_ctrl = 1;
		prev_sum = sum;
		sum = sum + prod;
		count = count +1;
		prod_ctrl = 0;
		b_valid <=1;
	end
	
	else if(count == numWeight+2)
	begin
		inpt_valid_ctrl<=0;
		count = count +1;
		b_valid <=0;
		prev_sum = sum;
		if(mult == 1)
		sum = sum>>>in_depth;
		sum = sum + bout;
	end
	else if(count == numWeight+3)
	begin
	   sig_en = 1;
	   count = count +1;
	end
	else if(count == numWeight+4 && sig_end == 1)
	begin
	   sig_en = 0; 
	   sout = sout_n;
	   count = count +1;
	end
	else if(count == numWeight+5)
	begin
	   
		rst <= 1;
		count <= 0;
		s_valid = 1;

	end
	
	if(rst == 1)
	begin
		rst <= 0;
		s_valid <= 0;
		
	end
	
end
endmodule
