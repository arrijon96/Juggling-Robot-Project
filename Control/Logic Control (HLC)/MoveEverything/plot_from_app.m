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
                
                app.ShoulderAxes.XLim = [0 cont+10];
                app.TransverseAxes.XLim = [0 cont+10];
                app.ElbowAxes.XLim = [0 cont+10];
                
                plot(app.ShoulderAxes,cont,enc1.Data/1152*(2*pi),'.r');
                plot(app.ShoulderAxes,cont,app.ShoulderradSlider.Value,'.b');
                legend(app.ShoulderAxes,'reference1','encoder1');
                plot(app.TransverseAxes,cont,enc1.Data/1536*(2*pi),'.r');
                plot(app.TransverseAxes,cont,app.TransverseradSlider.Value,'.b');
                legend(app.TransverseAxes,'reference2','encoder2');
                plot(app.ElbowAxes,cont,enc1.Data/70*(2*pi),'.r');
                plot(app.ElbowAxes,cont,app.ElbowradSlider.Value,'.b');
                legend(app.ElbowAxes,'reference3','encoder3');
                drawnow; 
                
                hold(app.ShoulderAxes, "on");
                hold(app.TransverseAxes, "on");
                hold(app.ElbowAxes, "on");
            end