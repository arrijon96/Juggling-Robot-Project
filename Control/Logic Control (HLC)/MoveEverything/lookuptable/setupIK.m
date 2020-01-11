function [gik, posTgt, jointConst, robot, joint_limits, prohib]=setupIK()
     %% Import robot
        robot = importrobot('jurp1.urdf');
        robot.DataFormat = 'struct';

        %% Define IK
        gik = generalizedInverseKinematics();
        %gik.SolverAlgorithm = 'LevenbergMarquardt';
        gik.RigidBodyTree = robot;
        gik.ConstraintInputs = {'position','joint'};

        posTgt = constraintPositionTarget('Hand_Link');
        %posTgt.PositionTolerance = 0.005;
        %posTgt.Weights = 1;

        % aimTgt = constraintAiming('Hnad_Link');
        % aimTgt.TargetPoint = [0,100,0];



        jointConst = constraintJointBounds(robot);
        joint_limits = [-pi/2.25 0.7;-0.8 0.8;-2.35 0];
        jointConst.Bounds = joint_limits;
        %jointConst.Weights = [0.1 1 0.1];


        %% Define prohibited area

        %Triangle (check --> https://se.mathworks.com/matlabcentral/answers/308729-how-to-plot-a-triangular-prism)
        prohib.A = [0.2362 0 0.5]; 
        prohib.B = [0.2362 0 1.3]; 
        prohib. E = [-0.2638 0.75 0.5]; 
        prohib.F = [-0.2638 0.75 1.3]; 
        prohib.D = [0.7362 0.75 0.5]; 
        prohib.C = [0.7362 0.75 1.3];
end