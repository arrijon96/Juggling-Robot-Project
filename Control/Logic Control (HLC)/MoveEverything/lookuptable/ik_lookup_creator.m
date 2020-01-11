clear;clf;close all;clc;

%% Setup IK
[gik, posTgt, jointConst, robot, joint_limits, prohib]=setupIK();
z_catch = 0.9884;

%%
load('one_hot')

[n_rows,n_cols] = size(one_hot);

ik_lookup = cell(n_rows,n_rows,3);

for curr_row = 1:n_rows
    for curr_col = 1:n_cols
        if one_hot(curr_row,curr_col)
            x_catch = (curr_row-30)/100;
            y_catch = curr_col/100;
            
            catch_point = [x_catch y_catch z_catch]
            posTgt.TargetPosition = catch_point;
            tic
            [q,~] = gik(homeConfiguration(robot),posTgt, jointConst); %Inverse Kinematics
            sol = [q(1).JointPosition, q(2).JointPosition, q(3).JointPosition]
            toc
            
            ik_lookup{curr_row,curr_col,1} = -q(1).JointPosition;
            ik_lookup{curr_row,curr_col,2} = -q(2).JointPosition; 
            ik_lookup{curr_row,curr_col,3} = -q(3).JointPosition;
        else
            ik_lookup{curr_row,curr_col,1} = 0;
            ik_lookup{curr_row,curr_col,2} = 0; 
            ik_lookup{curr_row,curr_col,3} = 0;
        end
    end
end
