//////////////////////////////////////////////////////////////////////////////////
// Engineer: Arshyn Zhanbolatov
// 
// Create Date: 02.2019 
// Design Name: NOC
// Module Name: networkOnChip
// Project Name: SISNOC
//////////////////////////////////////////////////////////////////////////////////


module networkOnChip(
    input clk,
    input rst,
    input [11:0] input_packet,
    input input_valid,
    output input_ready,
    output [11:0] output_packet,
    output output_valid,
    input output_ready
    );


wire [11:0] west_east_packet[9:0][8:0], east_west_packet[9:0][8:0], south_north_packet[8:0][9:0], north_south_packet[8:0][9:0], ROUTER_NI_packet[9:0][9:0], NI_ROUTER_packet[9:0][9:0];
wire west_east_valid[9:0][8:0], east_west_valid[9:0][8:0], south_north_valid[8:0][9:0], north_south_valid[8:0][9:0], ROUTER_NI_valid[9:0][9:0], NI_ROUTER_valid[9:0][9:0];
wire west_east_ready[9:0][8:0], east_west_ready[9:0][8:0], south_north_ready[8:0][9:0], north_south_ready[8:0][9:0], ROUTER_NI_ready[9:0][9:0], NI_ROUTER_ready[9:0][9:0];

wire  NI_PE_status[9:0][9:0], NI_PE_teta0[9:0][9:0], NI_PE_alpha0[9:0][9:0], NI_PE_last[9:0][9:0], NI_PE_valid[9:0][9:0], NI_PE_ready[9:0][9:0],PE_NI_status[9:0][9:0], PE_NI_valid[9:0][9:0],PE_NI_ready[9:0][9:0];

genvar i,j;

generate for(j=0;j<10;j=j+1)
begin:y
    for(i=0;i<10;i=i+1)
    begin:x
        processingElement processingElement(
        clk,
        rst,
        NI_PE_status[j][i],
        NI_PE_teta0[j][i],
        NI_PE_alpha0[j][i],
        NI_PE_last[j][i],
        NI_PE_valid[j][i],
        NI_PE_ready[j][i],
        PE_NI_status[j][i],
        PE_NI_valid[j][i],
        PE_NI_ready[j][i]
        );
        networkInterface networkInterface (
        clk,
        rst,
        ROUTER_NI_packet[j][i],
        ROUTER_NI_valid[j][i],
        ROUTER_NI_ready[j][i],
        NI_PE_status[j][i],
        NI_PE_teta0[j][i],
        NI_PE_alpha0[j][i],
        NI_PE_last[j][i],
        NI_PE_valid[j][i],
        NI_PE_ready[j][i],
        PE_NI_status[j][i],
        PE_NI_valid[j][i],
        PE_NI_ready[j][i],
        NI_ROUTER_packet[j][i],
        NI_ROUTER_valid[j][i],
        NI_ROUTER_ready[j][i]
        );
        defparam networkInterface.ADDRESS={j[3:0],i[3:0]};
        
        if((j==0)&(i==0))
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(input_packet),
            .input_west_valid(input_valid),
            .input_west_ready(input_ready),
            .input_north_packet(south_north_packet[j][i]),
            .input_north_valid(south_north_valid[j][i]),
            .input_north_ready(south_north_ready[j][i]),
            .input_east_packet(west_east_packet[j][i]),
            .input_east_valid(west_east_valid[j][i]),
            .input_east_ready(west_east_ready[j][i]),
            .input_south_packet(),
            .input_south_valid(1'b0),
            .input_south_ready(),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
           
            .output_west_packet(output_packet),
            .output_west_valid(output_valid),
            .output_west_ready(output_ready),
            .output_north_packet(north_south_packet[j][i]),
            .output_north_valid(north_south_valid[j][i]),
            .output_north_ready(north_south_ready[j][i]),
            .output_east_packet(east_west_packet[j][i]),
            .output_east_valid(east_west_valid[j][i]),
            .output_east_ready(east_west_ready[j][i]),
            .output_south_packet(),
            .output_south_valid(),
            .output_south_ready(1'b1),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            );
            defparam router.Y=j, router.X=i;
        end
        else if((j==9)&(i==0))
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(),
            .input_west_valid(1'b0),
            .input_west_ready(),
            .input_north_packet(),
            .input_north_valid(1'b0),
            .input_north_ready(),
            .input_east_packet(west_east_packet[j][i]),
            .input_east_valid(west_east_valid[j][i]),
            .input_east_ready(west_east_ready[j][i]),
            .input_south_packet(north_south_packet[j-1][i]),
            .input_south_valid(north_south_valid[j-1][i]),
            .input_south_ready(north_south_ready[j-1][i]),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(),
            .output_west_valid(),
            .output_west_ready(1'b1),
            .output_north_packet(),
            .output_north_valid(),
            .output_north_ready(1'b1),
            .output_east_packet(east_west_packet[j][i]),
            .output_east_valid(east_west_valid[j][i]),
            .output_east_ready(east_west_ready[j][i]),
            .output_south_packet(south_north_packet[j-1][i]),
            .output_south_valid(south_north_valid[j-1][i]),
            .output_south_ready(south_north_ready[j-1][i]),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
            defparam router.Y=j, router.X=i;           
        end
        else if((j==9)&(i==9))
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(east_west_packet[j][i-1]),
            .input_west_valid(east_west_valid[j][i-1]),
            .input_west_ready(east_west_ready[j][i-1]),
            .input_north_packet(),
            .input_north_valid(1'b0),
            .input_north_ready(),
            .input_east_packet(),
            .input_east_valid(1'b0),
            .input_east_ready(),
            .input_south_packet(north_south_packet[j-1][i]),
            .input_south_valid(north_south_valid[j-1][i]),
            .input_south_ready(north_south_ready[j-1][i]),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(west_east_packet[j][i-1]),
            .output_west_valid(west_east_valid[j][i-1]),
            .output_west_ready(west_east_ready[j][i-1]),
            .output_north_packet(),
            .output_north_valid(),
            .output_north_ready(1'b1),
            .output_east_packet(),
            .output_east_valid(),
            .output_east_ready(1'b1),
            .output_south_packet(south_north_packet[j-1][i]),
            .output_south_valid(south_north_valid[j-1][i]),
            .output_south_ready(south_north_ready[j-1][i]),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
            defparam router.Y=j, router.X=i;     
        end    
        else if((j==0)&(i==9))
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(east_west_packet[j][i-1]),
            .input_west_valid(east_west_valid[j][i-1]),
            .input_west_ready(east_west_ready[j][i-1]),
            .input_north_packet(south_north_packet[j][i]),
            .input_north_valid(south_north_valid[j][i]),
            .input_north_ready(south_north_ready[j][i]),
            .input_east_packet(),
            .input_east_valid(1'b0),
            .input_east_ready(),
            .input_south_packet(),
            .input_south_valid(1'b0),
            .input_south_ready(),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(west_east_packet[j][i-1]),
            .output_west_valid(west_east_valid[j][i-1]),
            .output_west_ready(west_east_ready[j][i-1]),
            .output_north_packet(north_south_packet[j][i]),
            .output_north_valid(north_south_valid[j][i]),
            .output_north_ready(north_south_ready[j][i]),
            .output_east_packet(),
            .output_east_valid(),
            .output_east_ready(1'b1),
            .output_south_packet(),
            .output_south_valid(),
            .output_south_ready(1'b1),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
        defparam router.Y=j, router.X=i;  
        end           
        else if(i==0)
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(),
            .input_west_valid(1'b0),
            .input_west_ready(),
            .input_north_packet(south_north_packet[j][i]),
            .input_north_valid(south_north_valid[j][i]),
            .input_north_ready(south_north_ready[j][i]),
            .input_east_packet(west_east_packet[j][i]),
            .input_east_valid(west_east_valid[j][i]),
            .input_east_ready(west_east_ready[j][i]),
            .input_south_packet(north_south_packet[j-1][i]),
            .input_south_valid(north_south_valid[j-1][i]),
            .input_south_ready(north_south_ready[j-1][i]),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(),
            .output_west_valid(),
            .output_west_ready(1'b1),
            .output_north_packet(north_south_packet[j][i]),
            .output_north_valid(north_south_valid[j][i]),
            .output_north_ready(north_south_ready[j][i]),
            .output_east_packet(east_west_packet[j][i]),
            .output_east_valid(east_west_valid[j][i]),
            .output_east_ready(east_west_ready[j][i]),
            .output_south_packet(south_north_packet[j-1][i]),
            .output_south_valid(south_north_valid[j-1][i]),
            .output_south_ready(south_north_ready[j-1][i]),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
        defparam router.Y=j, router.X=i;  
        end
        else if(i==9)
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(east_west_packet[j][i-1]),
            .input_west_valid(east_west_valid[j][i-1]),
            .input_west_ready(east_west_ready[j][i-1]),
            .input_north_packet(south_north_packet[j][i]),
            .input_north_valid(south_north_valid[j][i]),
            .input_north_ready(south_north_ready[j][i]),
            .input_east_packet(),
            .input_east_valid(1'b0),
            .input_east_ready(),
            .input_south_packet(north_south_packet[j-1][i]),
            .input_south_valid(north_south_valid[j-1][i]),
            .input_south_ready(north_south_ready[j-1][i]),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(west_east_packet[j][i-1]),
            .output_west_valid(west_east_valid[j][i-1]),
            .output_west_ready(west_east_ready[j][i-1]),
            .output_north_packet(north_south_packet[j][i]),
            .output_north_valid(north_south_valid[j][i]),
            .output_north_ready(north_south_ready[j][i]),
            .output_east_packet(),
            .output_east_valid(),
            .output_east_ready(1'b1),
            .output_south_packet(south_north_packet[j-1][i]),
            .output_south_valid(south_north_valid[j-1][i]),
            .output_south_ready(south_north_ready[j-1][i]),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
        defparam router.Y=j, router.X=i;  
        end
        else if(j==0)
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(east_west_packet[j][i-1]),
            .input_west_valid(east_west_valid[j][i-1]),
            .input_west_ready(east_west_ready[j][i-1]),
            .input_north_packet(south_north_packet[j][i]),
            .input_north_valid(south_north_valid[j][i]),
            .input_north_ready(south_north_ready[j][i]),
            .input_east_packet(west_east_packet[j][i]),
            .input_east_valid(west_east_valid[j][i]),
            .input_east_ready(west_east_ready[j][i]),
            .input_south_packet(),
            .input_south_valid(1'b0),
            .input_south_ready(),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(west_east_packet[j][i-1]),
            .output_west_valid(west_east_valid[j][i-1]),
            .output_west_ready(west_east_ready[j][i-1]),
            .output_north_packet(north_south_packet[j][i]),
            .output_north_valid(north_south_valid[j][i]),
            .output_north_ready(north_south_ready[j][i]),
            .output_east_packet(east_west_packet[j][i]),
            .output_east_valid(east_west_valid[j][i]),
            .output_east_ready(east_west_ready[j][i]),
            .output_south_packet(),
            .output_south_valid(),
            .output_south_ready(1'b1),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
        defparam router.Y=j, router.X=i;  
        end
        else if(j==9)
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(east_west_packet[j][i-1]),
            .input_west_valid(east_west_valid[j][i-1]),
            .input_west_ready(east_west_ready[j][i-1]),
            .input_north_packet(),
            .input_north_valid(1'b0),
            .input_north_ready(),
            .input_east_packet(west_east_packet[j][i]),
            .input_east_valid(west_east_valid[j][i]),
            .input_east_ready(west_east_ready[j][i]),
            .input_south_packet(north_south_packet[j-1][i]),
            .input_south_valid(north_south_valid[j-1][i]),
            .input_south_ready(north_south_ready[j-1][i]),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(west_east_packet[j][i-1]),
            .output_west_valid(west_east_valid[j][i-1]),
            .output_west_ready(west_east_ready[j][i-1]),
            .output_north_packet(),
            .output_north_valid(),
            .output_north_ready(1'b1),
            .output_east_packet(east_west_packet[j][i]),
            .output_east_valid(east_west_valid[j][i]),
            .output_east_ready(east_west_ready[j][i]),
            .output_south_packet(south_north_packet[j-1][i]),
            .output_south_valid(south_north_valid[j-1][i]),
            .output_south_ready(south_north_ready[j-1][i]),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
        defparam router.Y=j, router.X=i;  
        end
        else
        begin
            router router (
            .clk(clk),
            .rst(rst),
            .input_west_packet(east_west_packet[j][i-1]),
            .input_west_valid(east_west_valid[j][i-1]),
            .input_west_ready(east_west_ready[j][i-1]),
            .input_north_packet(south_north_packet[j][i]),
            .input_north_valid(south_north_valid[j][i]),
            .input_north_ready(south_north_ready[j][i]),
            .input_east_packet(west_east_packet[j][i]),
            .input_east_valid(west_east_valid[j][i]),
            .input_east_ready(west_east_ready[j][i]),
            .input_south_packet(north_south_packet[j-1][i]),
            .input_south_valid(north_south_valid[j-1][i]),
            .input_south_ready(north_south_ready[j-1][i]),
            .input_center_packet(NI_ROUTER_packet[j][i]),
            .input_center_valid(NI_ROUTER_valid[j][i]),
            .input_center_ready(NI_ROUTER_ready[j][i]),
            
            .output_west_packet(west_east_packet[j][i-1]),
            .output_west_valid(west_east_valid[j][i-1]),
            .output_west_ready(west_east_ready[j][i-1]),
            .output_north_packet(north_south_packet[j][i]),
            .output_north_valid(north_south_valid[j][i]),
            .output_north_ready(north_south_ready[j][i]),
            .output_east_packet(east_west_packet[j][i]),
            .output_east_valid(east_west_valid[j][i]),
            .output_east_ready(east_west_ready[j][i]),
            .output_south_packet(south_north_packet[j-1][i]),
            .output_south_valid(south_north_valid[j-1][i]),
            .output_south_ready(south_north_ready[j-1][i]),
            .output_center_packet(ROUTER_NI_packet[j][i]),
            .output_center_valid(ROUTER_NI_valid[j][i]),
            .output_center_ready(ROUTER_NI_ready[j][i])
            ); 
        defparam router.Y=j, router.X=i;  
        end
    end
end
endgenerate

        
endmodule
