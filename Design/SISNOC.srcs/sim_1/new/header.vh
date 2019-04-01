task simulateSISmodel(input integer adjacencyMatrix_fd, input [99:0] gamma, input [99:0] beta, input integer simulationTime, input integer output_mcd);
begin  
    fork        
        begin: output_block
            integer i,j, discreteTime, runTime, configurationTime;
            reg [4:0] currCounter; 
            reg [4:0] counter[9:0][9:0];
            reg status[9:0][9:0][31:0];
            reg valid[9:0][9:0][31:0];
            reg [6:0] I; 
            reg check; 
            reg run;
            /*
            //delete
            reg dummy;   
            //end delete
            */
            for(j=0;j<10;j=j+1)
                for(i=0;i<10;i=i+1)
                    counter[j][i]=0;
            currCounter=0;  
            discreteTime=0; 
            run=0;
            runTime=0;
            configurationTime=0; 
            /*
            //delete
            dummy=1;
            //end delete 
            */
            repeat(10)
            begin
            @ (posedge clk);
            end                
            forever 
            begin
                @ (posedge clk)
                for(j=0;j<10;j=j+1)
                        for(i=0;i<10;i=i+1)
                            if(SISNOC.NI_ROUTER_valid[j][i]&SISNOC.NI_ROUTER_ready[j][i])
                            begin
                                valid[j][i][counter[j][i]]=1'b1;
                                status[j][i][counter[j][i]]=SISNOC.NI_ROUTER_packet[j][i][0];
                                counter[j][i]=counter[j][i]+1;
                                if(run==0)
                                    run=1;
                            end
                if(run)
                   runTime=runTime+1;
                else
                   configurationTime=configurationTime+1;           
                 for(check=1'b1,j=0;j<10;j=j+1)  
                    for(i=0;i<10;i=i+1)
                        check=check&valid[j][i][currCounter];
                 if(check)
                 begin  
                    I=0;                           
                    for(j=0;j<10;j=j+1)
                    begin  
                        for(i=0;i<10;i=i+1)
                        begin            
                            /*
                            //delete
                            if(dummy)
                            begin
                               $write("%b",status[j][i][currCounter]);
                            end
                            //end delete  
                            */                  
                            if(status[j][i][currCounter]==1'b1)
                                I=I+1;
                            valid[j][i][currCounter]=1'b0; 
                         end
                    end
                    /*
                    //delete
                    if(dummy) 
                        $write("\n");
                    dummy=0;
                    //end delete   
                    */             
                    currCounter=currCounter+1;
                    discreteTime=discreteTime+1;
                    /*
                    //delete
                    $write("%0d ", I);  
                    //end delete
                    */
                    $fwrite(output_mcd, "%0d ", I); 
                    if(discreteTime==simulationTime) 
                    begin 
                        $write("\n"); 
                        $fwrite(output_mcd, "\nConfiguration time: %0d, Run time: %0d", configurationTime, runTime);
                        $fclose(output_mcd);
                        disable simulateSISmodel;   
                    end              
                 end                      
            end
            /*
            integer i;
            reg [6:0] I;
            reg [3:0] counter[99:0];
            reg [99:0] status[15:0];
            reg [99:0] valid[15:0];
            reg [3:0] currCounter;
            
            @(posedge clk)
            if(input_valid)
            begin            
                status[counter[input_packet[9:6]*10+input_packet[5:2]]][input_packet[9:6]*10+input_packet[5:2]]=input_packet[0]; 
                valid[counter[input_packet[9:6]*10+input_packet[5:2]]][input_packet[9:6]*10+input_packet[5:2]]=1'b1;
                counter[input_packet[9:6]*10+input_packet[5:2]]= counter[input_packet[9:6]*10+input_packet[5:2]]+1;
                if(valid[currCounter]=={100{1'b1}})
                begin
                    for(i=0,I=0;i<100;i=i+1)
                    begin
                        if(status[currCounter][i]==1'b1)
                            I=I+1;
                    end  
                    $fdisplay(output_fd,"%d", I);                  
                    valid[currCounter]={100{1'b0}};
                    currCounter=currCounter+1;
                end               
            end
            */
        end
        begin            
            rst<=1;
            repeat(10)
            begin
                @(posedge clk);
            end
            rst<=0;
            output_valid<=1'b1;
            configureRoutingTable(adjacencyMatrix_fd);
            configureRate(gamma);
            configureRate(beta);
            configureNode(adjacencyMatrix_fd);
            output_valid<=1'b0;
        end
    join
end
endtask

task configureRoutingTable(input integer adjacencyMatrix_fd);
reg adjacencyMatrix[99:0][99:0];
reg [4:0] routingTable[99:0][99:0];
integer i,j, x, y;
reg [7:0] input_address, output_address;
/*
//delete
integer mcd;
//end delete
*/

begin
    //Fill Adjacency Matrix from a file
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<100;i=i+1)
        begin
            if(i==99)
            begin
                $fscanf(adjacencyMatrix_fd,"%b\n", adjacencyMatrix[j][i]);
            end
            else
                $fscanf(adjacencyMatrix_fd,"%b\t", adjacencyMatrix[j][i]);
        end
    end
    /*
    //delete
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<j;i=i+1)
        begin
            adjacencyMatrix[j][i]=adjacencyMatrix[i][j];
        end
    end
    for(j=0;j<100;j=j+1)
    begin
        $write("\n%d:",j);
        for(i=0;i<100;i=i+1)
        begin
            if(adjacencyMatrix[j][i])
                $write("%d ", i);
        end
    end
    
    mcd=$fopen("adjacencyMatrix.txt");
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<100;i=i+1)
        begin
            if(i==99)
            begin
                if(j==99)
                    $fwrite(mcd,"%b", adjacencyMatrix[j][i]);
                else
                    $fwrite(mcd,"%b\n", adjacencyMatrix[j][i]);
            end
            else
                $fwrite(mcd,"%b\t", adjacencyMatrix[j][i]);
        end
    end
    $fclose(mcd);
    //end delete
    */
    //End Fill Adjacency Matrix from a file
   
    //Initialize Routing Table 
    for(j=0;j<100;j=j+1)
        for(i=0;i<100;i=i+1)
            routingTable[j][i]=5'b00000;            
    //End Initialize Routing Table  
     
     /*  
    //Route to Home
    for(i=0;i<100;i=i+1)
    begin 
        output_address=address(i);
        for(x=output_address[3:0];x>0;x=x-1)
        begin
            routingTable[output_address[7:4]*10+x][i][4]=1'b1;
        end
        for(y=output_address[7:4];y>0;y=y-1)
        begin
            routingTable[y*10][i][1]=1'b1;
        end  
        routingTable[0][i][4]=1'b1;                         
    end     
    //End Route to Home  
     */
      
    //Fill Routing Table from Adjacency Matrix
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<100;i=i+1)
        begin
            if(adjacencyMatrix[j][i]==1'b1)
            begin 
                input_address=address(i);
                output_address=address(j);
                if(output_address[3:0]>input_address[3:0])
                begin
                    for(x=output_address[3:0]; x>input_address[3:0]; x=x-1)
                    begin
                        routingTable[output_address[7:4]*10+x][j][4]=1'b1;
                    end                    
                end
                else if(output_address[3:0]<input_address[3:0])
                begin
                    for(x=output_address[3:0]; x<input_address[3:0]; x=x+1)
                    begin
                        routingTable[output_address[7:4]*10+x][j][2]=1'b1;
                    end                    
                end
                if(output_address[7:4]>input_address[7:4])
                begin
                    for(y=output_address[7:4];y>input_address[7:4];y=y-1)
                    begin
                        routingTable[y*10+input_address[3:0]][j][1]=1'b1;
                    end
                end
                else if(output_address[7:4]<input_address[7:4])
                begin
                    for(y=output_address[7:4];y<input_address[7:4];y=y+1)
                    begin
                        routingTable[y*10+input_address[3:0]][j][3]=1'b1;
                    end
                end
                routingTable[i][j][0]=1'b1;
            end
        end
    end    
    //End Fill Routing Table from Adjacency Matrix
    
    for(j=0;j<100;j=j+1)
        for(i=0;i<50;i=i+1)
            sendPacket({2'b11,routingTable[j][i*2+1],routingTable[j][i*2]});  
end
endtask

function [7:0] address(input [6:0] index);
reg [3:0] x,y;
begin
    x=index%10;
    y=index/10;
    address={y,x};
end
endfunction

task sendPacket(input [11:0] packet);
begin
    output_packet<=packet;
    forever
    begin
        @(posedge clk)
        if(output_ready)
        begin
            disable sendPacket; 
        end
    end
end
endtask

task configureRate(input [6:0] rate_integer);
reg [99:0] rate_vector;
integer i;
begin
    for(i=0;i<100;i=i+1)
    begin
        if(i<rate_integer)
            rate_vector[i]=1'b1;
        else
            rate_vector[i]=1'b0;
    end
    repeat(5)
    begin
        rate_vector=shuffledVector(rate_vector);
    end
    
    for(i=0;i<10;i=i+1)
    begin
        sendPacket({2'b10, rate_vector[i*10+:10]});
    end   
end
endtask

function [99:0] shuffledVector(input [99:0] vector);
integer i;
reg temp;
integer index;
begin
    shuffledVector=vector;
    for(i=0;i<99;i=i+1)
    begin
        index=i+{$random()}%(100-i);
        temp=shuffledVector[i];
        shuffledVector[i]=shuffledVector[index];
        shuffledVector[index]=temp;        
    end
end
endfunction

task configureNode(input integer adjacencyMatrix_fd);
reg adjacencyMatrix[99:0][99:0];
reg [6:0] inputNum[99:0];
reg [99:0] initialStatus;
integer i,j;
begin
    //Initialize Input Number
    for(i=0;i<100;i=i+1)
        inputNum[i]=0;
    //End Initialize Input Number 
    
    //Fill Adjacency Matrix from a file
    $fseek(adjacencyMatrix_fd, 0, 0);
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<100;i=i+1)
        begin
            if(i==99)
            begin
                $fscanf(adjacencyMatrix_fd,"%b\n", adjacencyMatrix[j][i]);
            end
            else
                $fscanf(adjacencyMatrix_fd,"%b\t", adjacencyMatrix[j][i]);
        end
    end
    /*
    //delete
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<j;i=i+1)
        begin
            adjacencyMatrix[j][i]=adjacencyMatrix[i][j];
        end
    end
    //end delete 
    */
    //End Fill Adjacency Matrix from a file    
    
    //Fill Input Number from Adjacency Matrix
    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<100;i=i+1)
        begin
            if(adjacencyMatrix[j][i]==1'b1)
                inputNum[j]=inputNum[j]+1;
        end
    end
    for(i=0;i<100;i=i+1)
        inputNum[i]=inputNum[i]-1;
    //End Fill Input Number from Adjacency Matrix  
          
   //Fill Initial Infection Status 
    $fscanf(adjacencyMatrix_fd, "%100b", initialStatus);
    $fclose(adjacencyMatrix_fd);
    /*
    for(i=0;i<100;i=i+1)
    begin
        if(i<I0)
            initialStatus[i]=1'b1;
        else
            initialStatus[i]=1'b0;
    end
  
    repeat(5)
    begin
        initialStatus=shuffledVector(initialStatus);
    end
   
   $display("%b\n", initialStatus);
   //end delete
   */ 
   //End Fill Initial Infection Status    

    for(j=0;j<100;j=j+1)
    begin
        for(i=0;i<4;i=i+1)
        begin
            if(i!=3)
                sendPacket({2'b00, address(j), inputNum[j][i*2+:2]});
            else
                sendPacket({2'b00, address(j), initialStatus[99-j] ,inputNum[j][i*2]});
        end
    end      
end
endtask

task average(input integer numOfPoints,input integer fd1,input integer fd2,input integer fd3,input integer fd4,input integer fd5,input integer fd6,input integer fd7,input integer fd8,input integer fd9,input integer fd10,input integer mcd);
integer value[10:1];
integer i;
begin
    $fwrite(mcd,"time, infected, susceptable\n");
    for(i=0;i<numOfPoints;i=i+1)
    begin
        $fscanf(fd1, "%d ", value[1]);
        $fscanf(fd2, "%d ", value[2]);
        $fscanf(fd3, "%d ", value[3]);
        $fscanf(fd4, "%d ", value[4]);
        $fscanf(fd5, "%d ", value[5]);
        $fscanf(fd6, "%d ", value[6]);
        $fscanf(fd7, "%d ", value[7]);
        $fscanf(fd8, "%d ", value[8]);
        $fscanf(fd9, "%d ", value[9]);
        $fscanf(fd10, "%d ", value[10]);
        $fwrite(mcd, "%0d, %.3f, %.3f\n",i, (value[1]+value[2]+value[3]+value[4]+value[5]+value[6]+value[7]+value[8]+value[9]+value[10])/1000.000, (1.000-(value[1]+value[2]+value[3]+value[4]+value[5]+value[6]+value[7]+value[8]+value[9]+value[10])/1000.000));
    end
    $fclose(fd1);
    $fclose(fd2);
    $fclose(fd3);
    $fclose(fd4);
    $fclose(fd5);
    $fclose(fd6);
    $fclose(fd7);
    $fclose(fd8);
    $fclose(fd9);
    $fclose(fd10);
    $fclose(mcd);
end
endtask