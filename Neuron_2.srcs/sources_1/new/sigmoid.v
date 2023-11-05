`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2023 11:40:51
// Design Name: 
// Module Name: sigmoid
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
// 
//////////////////////////////////////////////////////////////////////////////////
/*
packed and unpacked
*/

module sigmoid#(parameter s_width = 29,in_width = 8)(
input wire clk,
input wire sig_en,
input wire [s_width-1:0]x,
output reg [in_width-1:0]sig,
output reg sig_end
    );
    reg [30:0] ind[124:0]; 
    integer i;
    initial
    begin
      $readmemb("sig.mem",ind);
    end
    always@(posedge clk)
    begin
        if(sig_en == 1)
        begin
            for(i=0;i<124;i=i+1)
            begin
                if(ind[i]<=x && x<ind[i+1])
                sig = {1'b1,i[7:0]};
            end
            sig_end = 1;
        end
        
    end
endmodule
