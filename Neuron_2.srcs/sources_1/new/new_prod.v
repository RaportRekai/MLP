`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2023 13:18:57
// Design Name: 
// Module Name: mult
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// The code multiplies the weight with input and returns a signed product as the output
//////////////////////////////////////////////////////////////////////////////////


module new_prod #(parameter in_depth = 17, w_depth = 9,a_width = in_depth+w_depth-1)
(
input clk,
input ctrl,
input [in_depth-1:0]a,
input [w_depth-1:0]b,
output reg signed [a_width:0]prod
);

    integer i;
     reg signed [a_width-1:0]t_a;
     reg signed [w_depth-1:0]t_b; 
     reg signed [a_width:0]sum; 
    
    initial
    begin
    sum = 1'd0;
    prod = 1'd0;
    
    end
    always@(posedge clk)
    begin
        if(a[in_depth-1] == 1 && b[w_depth-1] == 0)
        begin
        t_a = -a;
        t_b = b;
        end
        else if(b[w_depth-1] == 1 && a[in_depth-1] == 0)
        begin
        t_a = a;
        t_b = -b;
        end
        else if(b[w_depth-1] == 1 && a[in_depth-1] == 1)
        begin
        t_a = -a;
        t_b = -b;
        end
        else
        begin
        t_a = a;
        t_b = b;
        end
        sum = 1'd0;
        for(i= w_depth - 1; i>=0 ; i=i-1)
        begin
            if(t_b[i]==1)
            begin
              sum = sum + (t_a<<<i);
            end
        end
        if((a[in_depth-1] == 1 && b[w_depth-1] == 0) ||(a[in_depth-1] == 0 && b[w_depth-1] == 1) )
        prod = -sum;

        else
        prod = sum;
        
    end
endmodule


