
vicon_pos = rossubscriber('/object_update');
encoder = rossubscriber('/encoder');
encoder3 = rossubscriber('/encoder3');


object_index = 1;
cont = 0;
while true
    cont = cont+1;
    
    %Vicon
    coords = receive(vicon_pos,1);         % Receiving Vicon coordinates
    ball_pos(cont,1) = coords.Objects(object_index).X/1000;
    ball_pos(cont,2) = coords.Objects(object_index).Y/1000;
    ball_pos(cont,3) = coords.Objects(object_index).Z/1000;
    toc
    
    %Encoders
    enc12 = receive(encoder,1);
    enc_val(cont,1) = enc12.X;
    enc_val(cont,2) = enc12.Y;
    
    enc3 = receive(encoder3,1);
    enc_val(cont,3) = enc3.Data;
    
    %Save in a cell
    S{round(ball_pos(cont,1)*100+40), round(ball_pos(cont,2)*100),1} = enc_val(cont,1);
    S{round(ball_pos(cont,1)*100+40), round(ball_pos(cont,2)*100),2} = enc_val(cont,2);
    S{round(ball_pos(cont,1)*100+40), round(ball_pos(cont,2)*100),3} = enc_val(cont,3);
    
    pause(0.01);
end
