
module testbench;

parameter in_depth = 8;
parameter numWeight = 30;
parameter w_datawidth = 16;
parameter s_depth = $clog2((2**(w_datawidth+in_depth)-1)*numWeight);

reg clk;
reg inpt_valid;
wire [s_depth-1:0] sout [numWeight-1:0];
reg [in_depth-1:0] bias_add ;
reg [in_depth-1:0] inpt;

new_neuron #(.out_width(in_depth),.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n1.mem"),.biasFile("bias_1.mem")) n1
 (.clk(clk),
  .bias_add(0),	
  .inpt_valid(inpt_valid),
  .mult(0),
  .inpt(inpt),
  .sout(sout[0]));
//new_neuron #(.out_width(in_depth),.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n1.mem"),.biasFile("bias_1.mem")) n1
// (.clk(clk),
//  .bias_add(0),	
//  .inpt_valid(inpt_valid),
//  .mult(0),
//  .inpt(inpt),
//  .sout(sout[0]));
  
  
  
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(40),.weightFile("weight_n1.mem"),.biasFile("bias_1.mem")) n2
// (.clk(clk),
//  .bias_add(0),	
//  .inpt_valid(inpt_valid),
//  .mult(1),
//  .inpt(inpt),
//  .sum(sout[0]));

//new_neuron #(.numWeight(5),.numBias(1),.in_depth(in_depth),.weightFile("weight_n2.mem")) n2
// (.clk(clk),
//  .bias_add(1),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[1]));
  
//new_neuron #(.numWeight(5),.numBias(1),.in_depth(in_depth),.weightFile("weight_n3.mem")) n3
// (.clk(clk),
//  .bias_add(2),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[2]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n4.mem")) n4
// (.clk(clk),
//  .bias_add(0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[3]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n5.mem")) n5
// (.clk(clk),
//  .bias_add(0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[4]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n6.mem")) n6
// (.clk(clk),
//  .bias_add(0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[5]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n7.mem")) n7
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[6]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n8.mem")) n8
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[7]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n9.mem")) n9
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[8]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n10.mem")) n10
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[9]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n11.mem")) n11
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[10]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n12.mem")) n12
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[11]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n13.mem")) n13
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[12]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n14.mem")) n14
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[13]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n15.mem")) n15
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[14]));
  
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n16.mem")) n16
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[15]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n17.mem")) n17
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[16]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n18.mem")) n18
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[17]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n19.mem")) n19
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[18]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n20.mem")) n20
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[19]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n21.mem")) n21
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[20]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n22.mem")) n22
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[21]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n23.mem")) n23
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[22]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n24.mem")) n24
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[23]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n25.mem")) n25
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[24]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n26.mem")) n26
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[25]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n27.mem")) n27
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[26]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n28.mem")) n28
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[27]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n29.mem")) n29
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[28]));
  
//new_neuron #(.numWeight(numWeight),.numBias(1),.in_depth(in_depth),.weightFile("weight_n30.mem")) n30
// (.clk(clk),
//  .bias_add( 0),	
//  .inpt_valid(inpt_valid),
//  .inpt(inpt),
//  .sum(sout[29]));
  
        
initial 
begin
	clk = 0;
	inpt = 3;
	$monitor($time, "inpt_valid = %d, sout = %d, inpt = %d",inpt_valid,sout[1],inpt);
	bias_add = 0;
	#5 clk = 1;
	   inpt_valid = 1;
	   inpt = 5;
	#5 clk = 0;
	
	#5 clk = 1;
	   inpt = 2;
	#5 clk = 0;
	
	#5 clk = 1;
	   inpt = 9;
    #5 clk = 0;
    
	#5 clk = 1;
	   inpt = 7;
	#5 clk = 0;
	#5 clk = 1;
	   inpt = 4;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 clk = 0;
	#5 clk = 1;
	#5 $finish;
	
end
endmodule