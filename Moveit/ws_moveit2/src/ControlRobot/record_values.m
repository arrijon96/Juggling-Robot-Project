    cont = 0;

    subenc1 = rossubscriber('/encoder1','std_msgs/Float64');
    subenc2 = rossubscriber('/encoder2','std_msgs/Float64');
    subenc3 = rossubscriber('/encoder2','std_msgs/Float64');

    app.ShoulderAxes.YLim = [-1.7 1.7];
    app.TransverseAxes.YLim = [-1 1];
    app.ElbowAxes.YLim = [-1.7 1.1];

    while (1)
        cont = cont+1;

        enc1 = receive(subenc1);
        enc2 = receive(subenc2);
        enc3 = receive(subenc3);
        
        encoder1_data(cont) = enc1.Data;
        encoder2_data(cont) = enc2.Data;
        encoder3_data(cont) = enc3.Data;
    end
    return
    %%
    figure(1)
    plot(encoder1_data,'-r');
    plot(encoder2_data, '-g');
    plot(encoder2_data, '-b');
    legent('encoder1', 'encoder2', 'encoder3');
    
    figure(2)
    