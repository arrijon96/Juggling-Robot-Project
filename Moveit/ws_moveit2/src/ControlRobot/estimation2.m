function [Intersect] = estimation2(ballPosition,h_estim, t_arr)

    
%% Ball Trajectory estimation
% Altered version of the Matlab script developped by the JuRP-HK group.
% Current method: catching at a predefined height.

N_sample = length(ballPosition(:,1));

t_arr = t_arr(2:N_sample);
                                    % Number of buffered samples
TsBall = median(t_arr);             % Motion capture camera sample time  


vx = zeros(1, N_sample-1);
vy = zeros(1, N_sample-1);
vz = zeros(1, N_sample-1);

for i = 2:N_sample
    vx(i-1) = (ballPosition(i,1)-ballPosition(i-1,1))*(1/TsBall);
    vy(i-1) = (ballPosition(i,2)-ballPosition(i-1,2))*(1/TsBall);
    vz(i-1) = TsBall*(i-1)*9.81+(ballPosition(i,3)-ballPosition(i-1,3))*(1/TsBall);
end
        
v_median_x = median(vx);
v_median_y = median(vy);
v_median_z = median(vz);
        
g = -9.81;

 
%% Calculate trajectory and cup angle

%Trajectory
z_delta = h_estim - ballPosition(1,3);
t = real(max(roots([1 2/g*v_median_z -(2/g)*z_delta])));
Intersect(1,1) = v_median_x * t+ ballPosition(1,1); 
Intersect(1,2) = v_median_y * t+ ballPosition(1,2); 
Intersect(1,3) = h_estim;

end 