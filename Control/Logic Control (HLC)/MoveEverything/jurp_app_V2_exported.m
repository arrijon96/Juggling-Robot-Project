classdef jurp_app_V2_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        TabGroup                        matlab.ui.container.TabGroup
        MotionControlTab                matlab.ui.container.Tab
        MotionControllerLabel           matlab.ui.control.Label
        HomeButton                      matlab.ui.control.Button
        SimultaneouscommandsPanel       matlab.ui.container.Panel
        ShoulderEditField               matlab.ui.control.NumericEditField
        ShoulderEditFieldLabel          matlab.ui.control.Label
        TransverseEditField             matlab.ui.control.NumericEditField
        TransverseEditFieldLabel        matlab.ui.control.Label
        ElbowEditField                  matlab.ui.control.NumericEditField
        ElbowEditFieldLabel             matlab.ui.control.Label
        PublishButton                   matlab.ui.control.StateButton
        IndividualcommandsPanel         matlab.ui.container.Panel
        ShoulderSpinner                 matlab.ui.control.Spinner
        TransverseSpinner               matlab.ui.control.Spinner
        ElbowSpinner                    matlab.ui.control.Spinner
        ShoulderradSliderLabel          matlab.ui.control.Label
        ShoulderradSlider               matlab.ui.control.Slider
        TransverseradSliderLabel        matlab.ui.control.Label
        TransverseradSlider             matlab.ui.control.Slider
        ElbowradSliderLabel             matlab.ui.control.Label
        ElbowradSlider                  matlab.ui.control.Slider
        StartButton                     matlab.ui.control.Button
        JuggleLifeTab                   matlab.ui.container.Tab
        JuggleLifeLabel                 matlab.ui.control.Label
        InitialpositionPanel            matlab.ui.container.Panel
        ShoulderEditField_5             matlab.ui.control.NumericEditField
        ShoulderEditField_5Label        matlab.ui.control.Label
        TransverseEditField_5           matlab.ui.control.NumericEditField
        TransverseEditField_5Label      matlab.ui.control.Label
        ElbowEditField_5                matlab.ui.control.NumericEditField
        ElbowEditField_5Label           matlab.ui.control.Label
        GoButton_2                      matlab.ui.control.StateButton
        TossCatchButton                 matlab.ui.control.Button
        HomeButton_3                    matlab.ui.control.Button
        StartButton_2                   matlab.ui.control.Button
        CatchingheightEditField_2Label  matlab.ui.control.Label
        CatchingheightEditField_2       matlab.ui.control.NumericEditField
        JugglecontButton                matlab.ui.control.Button
        FinalpositionPanel              matlab.ui.container.Panel
        ShoulderEditField_10            matlab.ui.control.NumericEditField
        ShoulderEditField_10Label       matlab.ui.control.Label
        TransverseEditField_10          matlab.ui.control.NumericEditField
        TransverseEditField_10Label     matlab.ui.control.Label
        ElbowEditField_10               matlab.ui.control.NumericEditField
        ElbowEditField_10Label          matlab.ui.control.Label
        JuggleEstimationTab             matlab.ui.container.Tab
        JuggleEstimationLabel           matlab.ui.control.Label
        InitialpositionPanel_2          matlab.ui.container.Panel
        ShoulderEditField_9             matlab.ui.control.NumericEditField
        ShoulderEditField_9Label        matlab.ui.control.Label
        TransverseEditField_9           matlab.ui.control.NumericEditField
        TransverseEditField_9Label      matlab.ui.control.Label
        ElbowEditField_9                matlab.ui.control.NumericEditField
        ElbowEditField_9Label           matlab.ui.control.Label
        GoButton_3                      matlab.ui.control.StateButton
        TossCatchButton_2               matlab.ui.control.Button
        HomeButton_6                    matlab.ui.control.Button
        StartButton_5                   matlab.ui.control.Button
        JugglecontButton_2              matlab.ui.control.Button
        CatchingheightEditField_4Label  matlab.ui.control.Label
        CatchingheightEditField_4       matlab.ui.control.NumericEditField
        FinalpositionPanel_2            matlab.ui.container.Panel
        ShoulderEditField_11            matlab.ui.control.NumericEditField
        ShoulderEditField_11Label       matlab.ui.control.Label
        TransverseEditField_11          matlab.ui.control.NumericEditField
        TransverseEditField_11Label     matlab.ui.control.Label
        ElbowEditField_11               matlab.ui.control.NumericEditField
        ElbowEditField_11Label          matlab.ui.control.Label
        HumaninteractionTab             matlab.ui.container.Tab
        HomeButton_4                    matlab.ui.control.Button
        StartButton_3                   matlab.ui.control.Button
        TossingcommandsPanel            matlab.ui.container.Panel
        ShoulderEditField_8             matlab.ui.control.NumericEditField
        ShoulderEditField_8Label        matlab.ui.control.Label
        TransverseEditField_8           matlab.ui.control.NumericEditField
        TransverseEditField_8Label      matlab.ui.control.Label
        ElbowEditField_8                matlab.ui.control.NumericEditField
        ElbowEditField_8Label           matlab.ui.control.Label
        TossButton                      matlab.ui.control.StateButton
        HomeButton_5                    matlab.ui.control.Button
        StartButton_4                   matlab.ui.control.Button
        InteractButton                  matlab.ui.control.Button
        LivecatchingcommandsPanel       matlab.ui.container.Panel
        LimitxminEditField              matlab.ui.control.NumericEditField
        LimitxminEditFieldLabel         matlab.ui.control.Label
        LimityminEditField              matlab.ui.control.NumericEditField
        LimityminEditFieldLabel         matlab.ui.control.Label
        CatchingheightEditField_3       matlab.ui.control.NumericEditField
        CatchingheightEditField_3Label  matlab.ui.control.Label
        CatchButton_2                   matlab.ui.control.StateButton
        LimitxmaxEditField              matlab.ui.control.NumericEditField
        LimitxmaxEditFieldLabel         matlab.ui.control.Label
        LimitymaxEditField              matlab.ui.control.NumericEditField
        LimitymaxEditFieldLabel         matlab.ui.control.Label
        CatchingtimeEditField           matlab.ui.control.NumericEditField
        CatchingtimeEditFieldLabel      matlab.ui.control.Label
        LimitzEditField                 matlab.ui.control.NumericEditField
        LimitzEditFieldLabel            matlab.ui.control.Label
        HumaninteractionLabel           matlab.ui.control.Label
        EstimationcatchingcommandsPanel  matlab.ui.container.Panel
        SamplingthEditField             matlab.ui.control.NumericEditField
        SamplingthEditFieldLabel        matlab.ui.control.Label
        CatchheightEditField            matlab.ui.control.NumericEditField
        CatchheightEditFieldLabel       matlab.ui.control.Label
        CatchButton_3                   matlab.ui.control.StateButton
        HardcodedJuggleTab              matlab.ui.container.Tab
        StartPanel                      matlab.ui.container.Panel
        ShoulderEditField_2             matlab.ui.control.NumericEditField
        ShoulderEditField_2Label        matlab.ui.control.Label
        TransverseEditField_2           matlab.ui.control.NumericEditField
        TransverseEditField_2Label      matlab.ui.control.Label
        ElbowEditField_2                matlab.ui.control.NumericEditField
        ElbowEditField_2Label           matlab.ui.control.Label
        TossPanel                       matlab.ui.container.Panel
        ShoulderEditField_3             matlab.ui.control.NumericEditField
        ShoulderEditField_3Label        matlab.ui.control.Label
        TransverseEditField_3           matlab.ui.control.NumericEditField
        TransverseEditField_3Label      matlab.ui.control.Label
        ElbowEditField_3                matlab.ui.control.NumericEditField
        ElbowEditField_3Label           matlab.ui.control.Label
        CatchPanel                      matlab.ui.container.Panel
        ShoulderEditField_4             matlab.ui.control.NumericEditField
        ShoulderEditField_4Label        matlab.ui.control.Label
        TransverseEditField_4           matlab.ui.control.NumericEditField
        TransverseEditField_4Label      matlab.ui.control.Label
        ElbowEditField_4                matlab.ui.control.NumericEditField
        ElbowEditField_4Label           matlab.ui.control.Label
        JuggleButton                    matlab.ui.control.Button
        GotostartButton                 matlab.ui.control.Button
        IKTab                           matlab.ui.container.Tab
        TestIKPanel                     matlab.ui.container.Panel
        ShoulderEditField_6Label        matlab.ui.control.Label
        ShoulderEditField_6             matlab.ui.control.NumericEditField
        TransverseEditField_6Label      matlab.ui.control.Label
        TransverseEditField_6           matlab.ui.control.NumericEditField
        ElbowEditField_6Label           matlab.ui.control.Label
        ElbowEditField_6                matlab.ui.control.NumericEditField
        CalculateButton                 matlab.ui.control.Button
        PublishButton_3                 matlab.ui.control.Button
        CalculatePublishButton          matlab.ui.control.Button
        StatusPanel                     matlab.ui.container.Panel
        AllclearLampLabel               matlab.ui.control.Label
        AllclearLamp                    matlab.ui.control.Lamp
        CatchzoneLampLabel              matlab.ui.control.Label
        CatchzoneLamp                   matlab.ui.control.Lamp
        JointstatesLampLabel            matlab.ui.control.Label
        JointstatesLamp                 matlab.ui.control.Lamp
        CatchPanel_2                    matlab.ui.container.Panel
        TossingheightEditFieldLabel     matlab.ui.control.Label
        TossingheightEditField          matlab.ui.control.NumericEditField
        CatchingheightEditFieldLabel    matlab.ui.control.Label
        CatchingheightEditField         matlab.ui.control.NumericEditField
        CatchButton                     matlab.ui.control.Button
        HomeButton_2                    matlab.ui.control.Button
        GotopointPanel                  matlab.ui.container.Panel
        xEditFieldLabel                 matlab.ui.control.Label
        xEditField                      matlab.ui.control.NumericEditField
        yEditFieldLabel                 matlab.ui.control.Label
        yEditField                      matlab.ui.control.NumericEditField
        zEditFieldLabel                 matlab.ui.control.Label
        zEditField                      matlab.ui.control.NumericEditField
        GoButton                        matlab.ui.control.Button
        ShoulderEditField_7Label        matlab.ui.control.Label
        ShoulderEditField_7             matlab.ui.control.NumericEditField
        TransverseEditField_7Label      matlab.ui.control.Label
        TransverseEditField_7           matlab.ui.control.NumericEditField
        ElbowEditField_7Label           matlab.ui.control.Label
        ElbowEditField_7                matlab.ui.control.NumericEditField
        FollowBallButton                matlab.ui.control.Button
    end

    
    properties (Access = public)
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
     
        end

        % Value changed function: ShoulderradSlider
        function ShoulderradSliderValueChanged(app, event)
            value = app.ShoulderradSlider.Value;
            app.ShoulderSpinner.Value = value;
            app.ShoulderEditField.Value = value;
            
            
        end

        % Value changed function: TransverseradSlider
        function TransverseradSliderValueChanged(app, event)
            value = app.TransverseradSlider.Value;
            app.TransverseSpinner.Value = value;
            app.TransverseEditField.Value = value;
            
            
        end

        % Value changed function: ElbowradSlider
        function ElbowradSliderValueChanged(app, event)
            value = app.ElbowradSlider.Value;
            app.ElbowSpinner.Value = value;
            app.ElbowradSlider.Value = value;
            app.ElbowEditField.Value = value;
            
            
        end

        % Value changed function: ShoulderSpinner
        function ShoulderSpinnerValueChanged(app, event)
            value = app.ShoulderSpinner.Value;
            app.ShoulderradSlider.Value = value;
            app.ShoulderEditField.Value = value;
            
            
        end

        % Value changed function: TransverseSpinner
        function TransverseSpinnerValueChanged(app, event)
            value = app.TransverseSpinner.Value;
            app.TransverseradSlider.Value=value;
            app.TransverseEditField.Value = value;
            
            
        end

        % Value changed function: ElbowSpinner
        function ElbowSpinnerValueChanged(app, event)
            value = app.ElbowSpinner.Value;
            app.ElbowradSlider.Value=value;
            app.ElbowEditField.Value = value;
           
            
        end

        % Button pushed function: HomeButton
        function HomeButtonPushed(app, event)
            app.ShoulderradSlider.Value = 0;
            app.ShoulderSpinner.Value = 0;
            app.ShoulderEditField.Value = 0;
            app.TransverseSpinner.Value = 0;
            app.TransverseradSlider.Value = 0;
            app.TransverseEditField.Value = 0;
            app.ElbowSpinner.Value = pi/2;
            app.ElbowradSlider.Value = pi/2;
            app.ElbowEditField.Value = pi/2;
            
            publish_motion(0, 0, pi/2);
                        
        end

        % Value changed function: PublishButton
        function PublishButtonValueChanged(app, event)
            value1 = app.ShoulderEditField.Value;
            value2 = app.TransverseEditField.Value;
            value3 = app.ElbowEditField.Value;
            
            app.ShoulderradSlider.Value = value1;
            app.ShoulderSpinner.Value = value1;
            app.TransverseSpinner.Value = value2;
            app.TransverseradSlider.Value = value2;
            app.ElbowSpinner.Value = value3;
            app.ElbowradSlider.Value = value3;            
            

            publish_motion(value1, value2, value3);           
        end

        % Value changed function: ShoulderEditField
        function ShoulderEditFieldValueChanged(app, event)
            value = app.ShoulderEditField.Value;
            
        end

        % Value changed function: TransverseEditField
        function TransverseEditFieldValueChanged(app, event)
            value = app.TransverseEditField.Value;
            
        end

        % Value changed function: ElbowEditField
        function ElbowEditFieldValueChanged(app, event)
            value = app.ElbowEditField.Value;
            
        end

        % Callback function
        function AnalyzeTabSizeChanged(app, event)

            
        end

        % Button pushed function: JuggleButton
        function JuggleButtonPushed(app, event)
            toss_value1 = app.ShoulderEditField_3.Value;
            toss_value2 = app.TransverseEditField_3.Value;
            toss_value3 = app.ElbowEditField_3.Value;
            
            catch_value1 = app.ShoulderEditField_4.Value;
            catch_value2 = app.TransverseEditField_4.Value;
            catch_value3 = app.ElbowEditField_4.Value;
            
            app.ShoulderradSlider.Value = catch_value1;
            app.ShoulderSpinner.Value = catch_value1;
            app.TransverseSpinner.Value = catch_value2;
            app.TransverseradSlider.Value = catch_value2;
            app.ElbowSpinner.Value = catch_value3;
            app.ElbowradSlider.Value = catch_value3;            
            
            publish_trajectory([toss_value1 catch_value1], [toss_value2 catch_value2], [toss_value3 catch_value3]);
        end

        % Button pushed function: StartButton
        function StartButtonPushed(app, event)
            app.ShoulderradSlider.Value = 0;
            app.ShoulderSpinner.Value = 0;
            app.ShoulderEditField.Value = 0;
            app.TransverseSpinner.Value = 0;
            app.TransverseradSlider.Value = 0;
            app.TransverseEditField.Value = 0;
            app.ElbowSpinner.Value = 0;
            app.ElbowradSlider.Value = 0;
            app.ElbowEditField.Value = 0;
            
            publish_motion(0, 0, 0);
        end

        % Callback function
        function ZeroDANGERButtonPushed(app, event)
            
        end

        % Value changed function: GoButton_2
        function GoButton_2ValueChanged(app, event)
            value = app.GoButton_2.Value;
            value1 = app.ShoulderEditField_5.Value;
            value2 = app.TransverseEditField_5.Value;
            value3 = app.ElbowEditField_5.Value;
            
            app.ShoulderradSlider.Value = value1;
            app.ShoulderSpinner.Value = value1;
            app.ShoulderEditField.Value = value1;
            app.TransverseSpinner.Value = value2;
            app.TransverseradSlider.Value = value2;
            app.TransverseEditField.Value = value2;
            app.ElbowSpinner.Value = value3;
            app.ElbowradSlider.Value = value3;
            app.ElbowEditField.Value = value3;           
            
            publish_motion(value1, value2, value3)
        end

        % Button pushed function: GotostartButton
        function GotostartButtonPushed(app, event)
            start_value1 = app.ShoulderEditField_2.Value;
            start_value2 = app.TransverseEditField_2.Value;
            start_value3 = app.ElbowEditField_2.Value;
            
            app.ShoulderradSlider.Value = start_value1;
            app.ShoulderSpinner.Value = start_value1;
            app.TransverseSpinner.Value = start_value2;
            app.TransverseradSlider.Value = start_value2;
            app.ElbowSpinner.Value = start_value3;
            app.ElbowradSlider.Value = start_value3;            
            
            publish_motion(start_value1, start_value2, start_value3);
        end

        % Callback function
        function TimingbetweentossandcatchEditFieldValueChanged(app, event)
            value = app.TimingbetweentossandcatchEditField.Value;
        end

        % Button pushed function: CalculateButton
        function CalculateButtonPushed(app, event)
            pos = track_ball();
            %[jointstates,flag] = ik_solve2(pos);
            
            jointstates(1) = app.lookup.ik_lookup{round(pos(1)*100+30),round(pos(2)*100),1}; 
            jointstates(2) = app.lookup.ik_lookup{round(pos(1)*100+30),round(pos(2)*100),2};
            jointstates(3) = app.lookup.ik_lookup{round(pos(1)*100+30),round(pos(2)*100),3};
            
            
            app.ShoulderEditField_6.Value = jointstates(1);
            app.TransverseEditField_6.Value= jointstates(2);
            app.ElbowEditField_6.Value= jointstates(3);
            
%             if flag(1) == 0
%                 app.AllclearLamp.Color = [1 0 0];
%             elseif flag(1) == 1
%                 app.AllclearLamp.Color = [0 1 0];
%             end
%             
%             if flag(2) == 0
%                 app.CatchzoneLamp.Color = [1 0 0];
%             elseif flag(2) == 1
%                 app.CatchzoneLamp.Color = [0 1 0];
%             end
%             
%             if flag(3) == 0
%                 app.JointstatesLamp.Color = [1 0 0];
%             elseif flag(3) == 1
%                 app.JointstatesLamp.Color = [0 1 0];
%             end
        end

        % Value changed function: ShoulderEditField_6
        function ShoulderEditField_6ValueChanged(app, event)
            value = app.ShoulderEditField_6.Value;
            
        end

        % Button pushed function: PublishButton_3
        function PublishButton_3Pushed(app, event)
            value1 = app.ShoulderEditField_6.Value;
            value2 = app.TransverseEditField_6.Value;
            value3 = app.ElbowEditField_6.Value;
            if app.AllclearLamp.Color == [0 1 0]
                publish_motion(value1, value2, value3);
            end
            
        end

        % Button pushed function: CalculatePublishButton
        function CalculatePublishButtonPushed(app, event)
            pos = track_ball();
            [JointStates,flag] = ik_solve2(pos);
            [JointStates,flag] = ik_security(JointStates, flag);
            publish_motion(JointStates(1), JointStates(2), JointStates(3));
            
            app.ShoulderEditField_6.Value = JointStates(1);
            app.TransverseEditField_6.Value = JointStates(2);
            app.ElbowEditField_6.Value = JointStates(3);
            
            if flag(1) == 0
                app.AllclearLamp.Color = [1 0 0];
            elseif flag(1) == 1
                app.AllclearLamp.Color = [0 1 0];
            end
            
            if flag(2) == 0
                app.CatchzoneLamp.Color = [1 0 0];
            elseif flag(2) == 1
                app.CatchzoneLamp.Color = [0 1 0];
            end
            
            if flag(3) == 0
                app.JointstatesLamp.Color = [1 0 0];
            elseif flag(3) == 1
                app.JointstatesLamp.Color = [0 1 0];
            end 
        end

        % Button pushed function: CatchButton
        function CatchButtonPushed(app, event)
            toss_height = app.TossingheightEditField.Value;
            catch_height = app.CatchingheightEditField.Value;
            %catch_ball(sample_th, catch_height)
            %catch_lookup(sample_th, catch_height,app.lookup.ik_lookup)
            catch_follow(catch_height, toss_height);
        end

        % Button pushed function: HomeButton_2
        function HomeButton_2Pushed(app, event)
            publish_motion(0,0,pi/2);
        end

        % Button pushed function: GoButton
        function GoButtonPushed(app, event)
            pos(1) = app.xEditField.Value;
            pos(2) = app.yEditField.Value;
            pos(3) = app.zEditField.Value;
            [JointStates,~] = ik_solve(pos);
            
            app.ShoulderEditField_7.Value = JointStates(1);
            app.TransverseEditField_7.Value = JointStates(2);
            app.ElbowEditField_7.Value = JointStates(3);
            
            publish_motion(JointStates(1), JointStates(2), JointStates(3));
        end

        % Button pushed function: FollowBallButton
        function FollowBallButtonPushed(app, event)
            followball()
        end

        % Button pushed function: TossCatchButton
        function TossCatchButtonPushed(app, event)
            jointstates(1) = app.ShoulderEditField_10.Value;
            jointstates(2) = app.TransverseEditField_10.Value;
            jointstates(3) = app.ElbowEditField_10.Value;
            
            catch_height = app.CatchingheightEditField_2.Value;
            juggle(catch_height, jointstates)
            %juggle_estimation(catch_height)
        end

        % Button pushed function: HomeButton_3
        function HomeButton_3Pushed(app, event)
            publish_motion(0,0,pi/2);
        end

        % Button pushed function: StartButton_2
        function StartButton_2Pushed(app, event)
            publish_motion(0,0,0);
        end

        % Button pushed function: JugglecontButton
        function JugglecontButtonPushed(app, event)
            toss_joints(1) = app.ShoulderEditField_5.Value;
            toss_joints(2) = app.TransverseEditField_5.Value;
            toss_joints(3) = app.ElbowEditField_5.Value;
            catch_height = app.CatchingheightEditField_2.Value;
            
            final_joints(1) = app.ShoulderEditField_10.Value;
            final_joints(2) = app.TransverseEditField_10.Value;
            final_joints(3) = app.ElbowEditField_10.Value;
            
            juggle_cont(toss_joints, final_joints, catch_height);
        end

        % Button pushed function: HomeButton_4
        function HomeButton_4Pushed(app, event)
            publish_motion(0,0,pi/2);
        end

        % Button pushed function: StartButton_3
        function StartButton_3Pushed(app, event)
            publish_motion(0,0,0);
        end

        % Value changed function: TossButton
        function TossButtonValueChanged(app, event)
            jointstate(1) = app.ShoulderEditField_8.Value; 
            jointstate(2) = app.TransverseEditField_8.Value;
            jointstate(3) = app.ElbowEditField_8.Value; 
            
            RefPub = rospublisher('reference','geometry_msgs/Vector3');
            RefMsg = rosmessage('geometry_msgs/Vector3');
            
            publish_motion(0,0,pi/2);
            publish_motion(0,0,1.2);
            publish_motion(0,0,1);
            publish_motion(0,0,0.9);
            %publish_motion(0,0,0.8);
            
            RefMsg.X = jointstate(1); RefMsg.Y =  jointstate(2); RefMsg.Z = jointstate(3);
            send(RefPub,RefMsg);
        end

        % Value changed function: CatchButton_2
        function CatchButton_2ValueChanged(app, event)
            limX(1) = app.LimitxminEditField.Value;
            limX(2) = app.LimitxmaxEditField.Value;
            limY(1) = app.LimityminEditField.Value;
            limY(2) = app.LimitymaxEditField.Value;
            %limZ = app.LimitzEditField.Value;
            time = app.CatchingtimeEditField.Value;
            
            catch_height = app.CatchingheightEditField_3.Value;
            
            catch_follow(limX, limY, catch_height, time);
            
        end

        % Button pushed function: HomeButton_5
        function HomeButton_5Pushed(app, event)
            publish_motion(0,0,pi/2);
        end

        % Button pushed function: StartButton_4
        function StartButton_4Pushed(app, event)
            publish_motion(0,0,0);
        end

        % Value changed function: CatchButton_3
        function CatchButton_3ValueChanged(app, event)
            sample_th = app.SamplingthEditField.Value;
            catch_height = app.CatchheightEditField.Value;
            catch_ball(sample_th, catch_height);
        end

        % Button pushed function: HomeButton_6
        function HomeButton_6Pushed(app, event)
            publish_motion(0,0,pi/2)
        end

        % Button pushed function: StartButton_5
        function StartButton_5Pushed(app, event)
            publish_motion(0,0,0)
        end

        % Value changed function: GoButton_3
        function GoButton_3ValueChanged(app, event)
            value1 = app.ShoulderEditField_9.Value;
            value2 = app.TransverseEditField_9.Value;
            value3 = app.ElbowEditField_9.Value;
            
            app.ShoulderradSlider.Value = value1;
            app.ShoulderSpinner.Value = value1;
            app.ShoulderEditField.Value = value1;
            app.TransverseSpinner.Value = value2;
            app.TransverseradSlider.Value = value2;
            app.TransverseEditField.Value = value2;
            app.ElbowSpinner.Value = value3;
            app.ElbowradSlider.Value = value3;
            app.ElbowEditField.Value = value3;           
            
            publish_motion(value1, value2, value3)
            
        end

        % Button pushed function: TossCatchButton_2
        function TossCatchButton_2Pushed(app, event)
            jointstates(1) = app.ShoulderEditField_11.Value;
            jointstates(2) = app.TransverseEditField_11.Value;
            jointstates(3) = app.ElbowEditField_11.Value;
            
            catch_height = app.CatchingheightEditField_4.Value;
            %juggle(catch_height, jointstates)
            juggle_estimation(catch_height, jointstates)
        end

        % Button pushed function: JugglecontButton_2
        function JugglecontButton_2Pushed(app, event)
            toss_joints(1) = app.ShoulderEditField_9.Value;
            toss_joints(2) = app.TransverseEditField_9.Value;
            toss_joints(3) = app.ElbowEditField_9.Value;
            catch_height = app.CatchingheightEditField_4.Value;
            
            final_joints(1) = app.ShoulderEditField_11.Value;
            final_joints(2) = app.TransverseEditField_11.Value;
            final_joints(3) = app.ElbowEditField_11.Value;
            
            catch_height = app.CatchingheightEditField_4.Value;
            
            juggle_cont_estim(toss_joints, final_joints, catch_height);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 634 471];
            app.UIFigure.Name = 'UI Figure';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [2 4 630 468];

            % Create MotionControlTab
            app.MotionControlTab = uitab(app.TabGroup);
            app.MotionControlTab.Title = 'Motion Control';

            % Create MotionControllerLabel
            app.MotionControllerLabel = uilabel(app.MotionControlTab);
            app.MotionControllerLabel.FontSize = 20;
            app.MotionControllerLabel.FontWeight = 'bold';
            app.MotionControllerLabel.Position = [197 410 172 24];
            app.MotionControllerLabel.Text = 'Motion Controller';

            % Create HomeButton
            app.HomeButton = uibutton(app.MotionControlTab, 'push');
            app.HomeButton.ButtonPushedFcn = createCallbackFcn(app, @HomeButtonPushed, true);
            app.HomeButton.Position = [510 74 100 22];
            app.HomeButton.Text = 'Home';

            % Create SimultaneouscommandsPanel
            app.SimultaneouscommandsPanel = uipanel(app.MotionControlTab);
            app.SimultaneouscommandsPanel.Title = 'Simultaneous commands';
            app.SimultaneouscommandsPanel.Position = [8 10 204 161];

            % Create ShoulderEditField
            app.ShoulderEditField = uieditfield(app.SimultaneouscommandsPanel, 'numeric');
            app.ShoulderEditField.Limits = [-1.5708 1.5708];
            app.ShoulderEditField.ValueChangedFcn = createCallbackFcn(app, @ShoulderEditFieldValueChanged, true);
            app.ShoulderEditField.Position = [83 110 100 22];

            % Create ShoulderEditFieldLabel
            app.ShoulderEditFieldLabel = uilabel(app.SimultaneouscommandsPanel);
            app.ShoulderEditFieldLabel.HorizontalAlignment = 'right';
            app.ShoulderEditFieldLabel.Position = [8 110 54 22];
            app.ShoulderEditFieldLabel.Text = 'Shoulder';

            % Create TransverseEditField
            app.TransverseEditField = uieditfield(app.SimultaneouscommandsPanel, 'numeric');
            app.TransverseEditField.Limits = [-0.8 0.8];
            app.TransverseEditField.ValueChangedFcn = createCallbackFcn(app, @TransverseEditFieldValueChanged, true);
            app.TransverseEditField.Position = [83 76 100 22];

            % Create TransverseEditFieldLabel
            app.TransverseEditFieldLabel = uilabel(app.SimultaneouscommandsPanel);
            app.TransverseEditFieldLabel.HorizontalAlignment = 'right';
            app.TransverseEditFieldLabel.Position = [8 76 65 22];
            app.TransverseEditFieldLabel.Text = 'Transverse';

            % Create ElbowEditField
            app.ElbowEditField = uieditfield(app.SimultaneouscommandsPanel, 'numeric');
            app.ElbowEditField.Limits = [0 2.35];
            app.ElbowEditField.ValueChangedFcn = createCallbackFcn(app, @ElbowEditFieldValueChanged, true);
            app.ElbowEditField.Position = [83 43 100 22];

            % Create ElbowEditFieldLabel
            app.ElbowEditFieldLabel = uilabel(app.SimultaneouscommandsPanel);
            app.ElbowEditFieldLabel.HorizontalAlignment = 'right';
            app.ElbowEditFieldLabel.Position = [8 43 38 22];
            app.ElbowEditFieldLabel.Text = 'Elbow';

            % Create PublishButton
            app.PublishButton = uibutton(app.SimultaneouscommandsPanel, 'state');
            app.PublishButton.ValueChangedFcn = createCallbackFcn(app, @PublishButtonValueChanged, true);
            app.PublishButton.Text = 'Publish';
            app.PublishButton.Position = [84 8 100 22];

            % Create IndividualcommandsPanel
            app.IndividualcommandsPanel = uipanel(app.MotionControlTab);
            app.IndividualcommandsPanel.Title = 'Individual commands';
            app.IndividualcommandsPanel.Position = [8 182 625 210];

            % Create ShoulderSpinner
            app.ShoulderSpinner = uispinner(app.IndividualcommandsPanel);
            app.ShoulderSpinner.Step = 0.1;
            app.ShoulderSpinner.Limits = [-1.5708 1.5708];
            app.ShoulderSpinner.ValueChangedFcn = createCallbackFcn(app, @ShoulderSpinnerValueChanged, true);
            app.ShoulderSpinner.Position = [511 159 100 22];

            % Create TransverseSpinner
            app.TransverseSpinner = uispinner(app.IndividualcommandsPanel);
            app.TransverseSpinner.Step = 0.1;
            app.TransverseSpinner.Limits = [-3.1416 3.1416];
            app.TransverseSpinner.ValueChangedFcn = createCallbackFcn(app, @TransverseSpinnerValueChanged, true);
            app.TransverseSpinner.Position = [511 96 100 22];

            % Create ElbowSpinner
            app.ElbowSpinner = uispinner(app.IndividualcommandsPanel);
            app.ElbowSpinner.Step = 0.1;
            app.ElbowSpinner.Limits = [0 2.35];
            app.ElbowSpinner.ValueChangedFcn = createCallbackFcn(app, @ElbowSpinnerValueChanged, true);
            app.ElbowSpinner.Position = [511 35 100 22];

            % Create ShoulderradSliderLabel
            app.ShoulderradSliderLabel = uilabel(app.IndividualcommandsPanel);
            app.ShoulderradSliderLabel.HorizontalAlignment = 'right';
            app.ShoulderradSliderLabel.Position = [8 159 82 22];
            app.ShoulderradSliderLabel.Text = 'Shoulder (rad)';

            % Create ShoulderradSlider
            app.ShoulderradSlider = uislider(app.IndividualcommandsPanel);
            app.ShoulderradSlider.Limits = [-1.5707963267949 1.5707963267949];
            app.ShoulderradSlider.MajorTicks = [-1.5707963267949 1.5707963267949];
            app.ShoulderradSlider.ValueChangedFcn = createCallbackFcn(app, @ShoulderradSliderValueChanged, true);
            app.ShoulderradSlider.MinorTicks = 0;
            app.ShoulderradSlider.Position = [125 169 335 3];

            % Create TransverseradSliderLabel
            app.TransverseradSliderLabel = uilabel(app.IndividualcommandsPanel);
            app.TransverseradSliderLabel.HorizontalAlignment = 'right';
            app.TransverseradSliderLabel.Position = [8 96 94 22];
            app.TransverseradSliderLabel.Text = 'Transverse (rad)';

            % Create TransverseradSlider
            app.TransverseradSlider = uislider(app.IndividualcommandsPanel);
            app.TransverseradSlider.Limits = [-0.8 0.8];
            app.TransverseradSlider.MajorTicks = [-0.8 0.8];
            app.TransverseradSlider.ValueChangedFcn = createCallbackFcn(app, @TransverseradSliderValueChanged, true);
            app.TransverseradSlider.MinorTicks = 0;
            app.TransverseradSlider.Position = [126 106 335 3];

            % Create ElbowradSliderLabel
            app.ElbowradSliderLabel = uilabel(app.IndividualcommandsPanel);
            app.ElbowradSliderLabel.HorizontalAlignment = 'right';
            app.ElbowradSliderLabel.Position = [13 37 67 22];
            app.ElbowradSliderLabel.Text = 'Elbow (rad)';

            % Create ElbowradSlider
            app.ElbowradSlider = uislider(app.IndividualcommandsPanel);
            app.ElbowradSlider.Limits = [0 2.35];
            app.ElbowradSlider.MajorTicks = [0 1.5707963267949 2.35];
            app.ElbowradSlider.ValueChangedFcn = createCallbackFcn(app, @ElbowradSliderValueChanged, true);
            app.ElbowradSlider.MinorTicks = 0;
            app.ElbowradSlider.Position = [123 47 339 3];

            % Create StartButton
            app.StartButton = uibutton(app.MotionControlTab, 'push');
            app.StartButton.ButtonPushedFcn = createCallbackFcn(app, @StartButtonPushed, true);
            app.StartButton.Position = [510 41 100 22];
            app.StartButton.Text = 'Start';

            % Create JuggleLifeTab
            app.JuggleLifeTab = uitab(app.TabGroup);
            app.JuggleLifeTab.Title = 'Juggle Life';

            % Create JuggleLifeLabel
            app.JuggleLifeLabel = uilabel(app.JuggleLifeTab);
            app.JuggleLifeLabel.FontSize = 20;
            app.JuggleLifeLabel.FontWeight = 'bold';
            app.JuggleLifeLabel.Position = [280 419 111 24];
            app.JuggleLifeLabel.Text = 'Juggle Life';

            % Create InitialpositionPanel
            app.InitialpositionPanel = uipanel(app.JuggleLifeTab);
            app.InitialpositionPanel.Title = 'Initial position';
            app.InitialpositionPanel.Position = [17 233 204 161];

            % Create ShoulderEditField_5
            app.ShoulderEditField_5 = uieditfield(app.InitialpositionPanel, 'numeric');
            app.ShoulderEditField_5.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_5.Position = [83 110 100 22];

            % Create ShoulderEditField_5Label
            app.ShoulderEditField_5Label = uilabel(app.InitialpositionPanel);
            app.ShoulderEditField_5Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_5Label.Position = [8 110 54 22];
            app.ShoulderEditField_5Label.Text = 'Shoulder';

            % Create TransverseEditField_5
            app.TransverseEditField_5 = uieditfield(app.InitialpositionPanel, 'numeric');
            app.TransverseEditField_5.Limits = [-0.8 0.8];
            app.TransverseEditField_5.Position = [83 76 100 22];

            % Create TransverseEditField_5Label
            app.TransverseEditField_5Label = uilabel(app.InitialpositionPanel);
            app.TransverseEditField_5Label.HorizontalAlignment = 'right';
            app.TransverseEditField_5Label.Position = [8 76 65 22];
            app.TransverseEditField_5Label.Text = 'Transverse';

            % Create ElbowEditField_5
            app.ElbowEditField_5 = uieditfield(app.InitialpositionPanel, 'numeric');
            app.ElbowEditField_5.Limits = [0 2.35];
            app.ElbowEditField_5.Position = [83 43 100 22];
            app.ElbowEditField_5.Value = 1.2;

            % Create ElbowEditField_5Label
            app.ElbowEditField_5Label = uilabel(app.InitialpositionPanel);
            app.ElbowEditField_5Label.HorizontalAlignment = 'right';
            app.ElbowEditField_5Label.Position = [8 43 38 22];
            app.ElbowEditField_5Label.Text = 'Elbow';

            % Create GoButton_2
            app.GoButton_2 = uibutton(app.InitialpositionPanel, 'state');
            app.GoButton_2.ValueChangedFcn = createCallbackFcn(app, @GoButton_2ValueChanged, true);
            app.GoButton_2.Text = 'Go';
            app.GoButton_2.Position = [84 8 100 22];

            % Create TossCatchButton
            app.TossCatchButton = uibutton(app.JuggleLifeTab, 'push');
            app.TossCatchButton.ButtonPushedFcn = createCallbackFcn(app, @TossCatchButtonPushed, true);
            app.TossCatchButton.Position = [280 199 100 22];
            app.TossCatchButton.Text = 'Toss & Catch';

            % Create HomeButton_3
            app.HomeButton_3 = uibutton(app.JuggleLifeTab, 'push');
            app.HomeButton_3.ButtonPushedFcn = createCallbackFcn(app, @HomeButton_3Pushed, true);
            app.HomeButton_3.Position = [509 51 100 22];
            app.HomeButton_3.Text = 'Home';

            % Create StartButton_2
            app.StartButton_2 = uibutton(app.JuggleLifeTab, 'push');
            app.StartButton_2.ButtonPushedFcn = createCallbackFcn(app, @StartButton_2Pushed, true);
            app.StartButton_2.Position = [509 18 100 22];
            app.StartButton_2.Text = 'Start';

            % Create CatchingheightEditField_2Label
            app.CatchingheightEditField_2Label = uilabel(app.JuggleLifeTab);
            app.CatchingheightEditField_2Label.HorizontalAlignment = 'right';
            app.CatchingheightEditField_2Label.Position = [25 199 89 22];
            app.CatchingheightEditField_2Label.Text = 'Catching height';

            % Create CatchingheightEditField_2
            app.CatchingheightEditField_2 = uieditfield(app.JuggleLifeTab, 'numeric');
            app.CatchingheightEditField_2.Position = [159 199 100 22];
            app.CatchingheightEditField_2.Value = 1;

            % Create JugglecontButton
            app.JugglecontButton = uibutton(app.JuggleLifeTab, 'push');
            app.JugglecontButton.ButtonPushedFcn = createCallbackFcn(app, @JugglecontButtonPushed, true);
            app.JugglecontButton.Position = [281 164 100 22];
            app.JugglecontButton.Text = 'Juggle (cont)';

            % Create FinalpositionPanel
            app.FinalpositionPanel = uipanel(app.JuggleLifeTab);
            app.FinalpositionPanel.Title = 'Final position';
            app.FinalpositionPanel.Position = [249 233 204 161];

            % Create ShoulderEditField_10
            app.ShoulderEditField_10 = uieditfield(app.FinalpositionPanel, 'numeric');
            app.ShoulderEditField_10.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_10.Position = [83 110 100 22];

            % Create ShoulderEditField_10Label
            app.ShoulderEditField_10Label = uilabel(app.FinalpositionPanel);
            app.ShoulderEditField_10Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_10Label.Position = [8 110 54 22];
            app.ShoulderEditField_10Label.Text = 'Shoulder';

            % Create TransverseEditField_10
            app.TransverseEditField_10 = uieditfield(app.FinalpositionPanel, 'numeric');
            app.TransverseEditField_10.Limits = [-0.8 0.8];
            app.TransverseEditField_10.Position = [83 76 100 22];

            % Create TransverseEditField_10Label
            app.TransverseEditField_10Label = uilabel(app.FinalpositionPanel);
            app.TransverseEditField_10Label.HorizontalAlignment = 'right';
            app.TransverseEditField_10Label.Position = [8 76 65 22];
            app.TransverseEditField_10Label.Text = 'Transverse';

            % Create ElbowEditField_10
            app.ElbowEditField_10 = uieditfield(app.FinalpositionPanel, 'numeric');
            app.ElbowEditField_10.Limits = [0 2.35];
            app.ElbowEditField_10.Position = [83 43 100 22];
            app.ElbowEditField_10.Value = 1.8;

            % Create ElbowEditField_10Label
            app.ElbowEditField_10Label = uilabel(app.FinalpositionPanel);
            app.ElbowEditField_10Label.HorizontalAlignment = 'right';
            app.ElbowEditField_10Label.Position = [8 43 38 22];
            app.ElbowEditField_10Label.Text = 'Elbow';

            % Create JuggleEstimationTab
            app.JuggleEstimationTab = uitab(app.TabGroup);
            app.JuggleEstimationTab.Title = 'Juggle Estimation';

            % Create JuggleEstimationLabel
            app.JuggleEstimationLabel = uilabel(app.JuggleEstimationTab);
            app.JuggleEstimationLabel.FontSize = 20;
            app.JuggleEstimationLabel.FontWeight = 'bold';
            app.JuggleEstimationLabel.Position = [241 410 178 24];
            app.JuggleEstimationLabel.Text = 'Juggle Estimation';

            % Create InitialpositionPanel_2
            app.InitialpositionPanel_2 = uipanel(app.JuggleEstimationTab);
            app.InitialpositionPanel_2.Title = 'Initial position';
            app.InitialpositionPanel_2.Position = [17 233 204 161];

            % Create ShoulderEditField_9
            app.ShoulderEditField_9 = uieditfield(app.InitialpositionPanel_2, 'numeric');
            app.ShoulderEditField_9.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_9.Position = [83 110 100 22];

            % Create ShoulderEditField_9Label
            app.ShoulderEditField_9Label = uilabel(app.InitialpositionPanel_2);
            app.ShoulderEditField_9Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_9Label.Position = [8 110 54 22];
            app.ShoulderEditField_9Label.Text = 'Shoulder';

            % Create TransverseEditField_9
            app.TransverseEditField_9 = uieditfield(app.InitialpositionPanel_2, 'numeric');
            app.TransverseEditField_9.Limits = [-0.8 0.8];
            app.TransverseEditField_9.Position = [83 76 100 22];

            % Create TransverseEditField_9Label
            app.TransverseEditField_9Label = uilabel(app.InitialpositionPanel_2);
            app.TransverseEditField_9Label.HorizontalAlignment = 'right';
            app.TransverseEditField_9Label.Position = [8 76 65 22];
            app.TransverseEditField_9Label.Text = 'Transverse';

            % Create ElbowEditField_9
            app.ElbowEditField_9 = uieditfield(app.InitialpositionPanel_2, 'numeric');
            app.ElbowEditField_9.Limits = [0 2.35];
            app.ElbowEditField_9.Position = [83 43 100 22];
            app.ElbowEditField_9.Value = 1.2;

            % Create ElbowEditField_9Label
            app.ElbowEditField_9Label = uilabel(app.InitialpositionPanel_2);
            app.ElbowEditField_9Label.HorizontalAlignment = 'right';
            app.ElbowEditField_9Label.Position = [8 43 38 22];
            app.ElbowEditField_9Label.Text = 'Elbow';

            % Create GoButton_3
            app.GoButton_3 = uibutton(app.InitialpositionPanel_2, 'state');
            app.GoButton_3.ValueChangedFcn = createCallbackFcn(app, @GoButton_3ValueChanged, true);
            app.GoButton_3.Text = 'Go';
            app.GoButton_3.Position = [84 8 100 22];

            % Create TossCatchButton_2
            app.TossCatchButton_2 = uibutton(app.JuggleEstimationTab, 'push');
            app.TossCatchButton_2.ButtonPushedFcn = createCallbackFcn(app, @TossCatchButton_2Pushed, true);
            app.TossCatchButton_2.Position = [280 199 100 22];
            app.TossCatchButton_2.Text = 'Toss & Catch';

            % Create HomeButton_6
            app.HomeButton_6 = uibutton(app.JuggleEstimationTab, 'push');
            app.HomeButton_6.ButtonPushedFcn = createCallbackFcn(app, @HomeButton_6Pushed, true);
            app.HomeButton_6.Position = [509 51 100 22];
            app.HomeButton_6.Text = 'Home';

            % Create StartButton_5
            app.StartButton_5 = uibutton(app.JuggleEstimationTab, 'push');
            app.StartButton_5.ButtonPushedFcn = createCallbackFcn(app, @StartButton_5Pushed, true);
            app.StartButton_5.Position = [509 18 100 22];
            app.StartButton_5.Text = 'Start';

            % Create JugglecontButton_2
            app.JugglecontButton_2 = uibutton(app.JuggleEstimationTab, 'push');
            app.JugglecontButton_2.ButtonPushedFcn = createCallbackFcn(app, @JugglecontButton_2Pushed, true);
            app.JugglecontButton_2.Position = [281 164 100 22];
            app.JugglecontButton_2.Text = 'Juggle (cont)';

            % Create CatchingheightEditField_4Label
            app.CatchingheightEditField_4Label = uilabel(app.JuggleEstimationTab);
            app.CatchingheightEditField_4Label.HorizontalAlignment = 'right';
            app.CatchingheightEditField_4Label.Position = [25 199 89 22];
            app.CatchingheightEditField_4Label.Text = 'Catching height';

            % Create CatchingheightEditField_4
            app.CatchingheightEditField_4 = uieditfield(app.JuggleEstimationTab, 'numeric');
            app.CatchingheightEditField_4.Position = [159 199 100 22];
            app.CatchingheightEditField_4.Value = 1;

            % Create FinalpositionPanel_2
            app.FinalpositionPanel_2 = uipanel(app.JuggleEstimationTab);
            app.FinalpositionPanel_2.Title = 'Final position';
            app.FinalpositionPanel_2.Position = [249 233 204 161];

            % Create ShoulderEditField_11
            app.ShoulderEditField_11 = uieditfield(app.FinalpositionPanel_2, 'numeric');
            app.ShoulderEditField_11.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_11.Position = [83 110 100 22];

            % Create ShoulderEditField_11Label
            app.ShoulderEditField_11Label = uilabel(app.FinalpositionPanel_2);
            app.ShoulderEditField_11Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_11Label.Position = [8 110 54 22];
            app.ShoulderEditField_11Label.Text = 'Shoulder';

            % Create TransverseEditField_11
            app.TransverseEditField_11 = uieditfield(app.FinalpositionPanel_2, 'numeric');
            app.TransverseEditField_11.Limits = [-0.8 0.8];
            app.TransverseEditField_11.Position = [83 76 100 22];

            % Create TransverseEditField_11Label
            app.TransverseEditField_11Label = uilabel(app.FinalpositionPanel_2);
            app.TransverseEditField_11Label.HorizontalAlignment = 'right';
            app.TransverseEditField_11Label.Position = [8 76 65 22];
            app.TransverseEditField_11Label.Text = 'Transverse';

            % Create ElbowEditField_11
            app.ElbowEditField_11 = uieditfield(app.FinalpositionPanel_2, 'numeric');
            app.ElbowEditField_11.Limits = [0 2.35];
            app.ElbowEditField_11.Position = [83 43 100 22];
            app.ElbowEditField_11.Value = 1.9;

            % Create ElbowEditField_11Label
            app.ElbowEditField_11Label = uilabel(app.FinalpositionPanel_2);
            app.ElbowEditField_11Label.HorizontalAlignment = 'right';
            app.ElbowEditField_11Label.Position = [8 43 38 22];
            app.ElbowEditField_11Label.Text = 'Elbow';

            % Create HumaninteractionTab
            app.HumaninteractionTab = uitab(app.TabGroup);
            app.HumaninteractionTab.Title = 'Human interaction';

            % Create HomeButton_4
            app.HomeButton_4 = uibutton(app.HumaninteractionTab, 'push');
            app.HomeButton_4.ButtonPushedFcn = createCallbackFcn(app, @HomeButton_4Pushed, true);
            app.HomeButton_4.Position = [509 51 100 22];
            app.HomeButton_4.Text = 'Home';

            % Create StartButton_3
            app.StartButton_3 = uibutton(app.HumaninteractionTab, 'push');
            app.StartButton_3.ButtonPushedFcn = createCallbackFcn(app, @StartButton_3Pushed, true);
            app.StartButton_3.Position = [509 18 100 22];
            app.StartButton_3.Text = 'Start';

            % Create TossingcommandsPanel
            app.TossingcommandsPanel = uipanel(app.HumaninteractionTab);
            app.TossingcommandsPanel.Title = 'Tossing commands';
            app.TossingcommandsPanel.Position = [20 248 204 161];

            % Create ShoulderEditField_8
            app.ShoulderEditField_8 = uieditfield(app.TossingcommandsPanel, 'numeric');
            app.ShoulderEditField_8.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_8.Position = [83 110 100 22];

            % Create ShoulderEditField_8Label
            app.ShoulderEditField_8Label = uilabel(app.TossingcommandsPanel);
            app.ShoulderEditField_8Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_8Label.Position = [8 110 54 22];
            app.ShoulderEditField_8Label.Text = 'Shoulder';

            % Create TransverseEditField_8
            app.TransverseEditField_8 = uieditfield(app.TossingcommandsPanel, 'numeric');
            app.TransverseEditField_8.Limits = [-0.8 0.8];
            app.TransverseEditField_8.Position = [83 76 100 22];

            % Create TransverseEditField_8Label
            app.TransverseEditField_8Label = uilabel(app.TossingcommandsPanel);
            app.TransverseEditField_8Label.HorizontalAlignment = 'right';
            app.TransverseEditField_8Label.Position = [8 76 65 22];
            app.TransverseEditField_8Label.Text = 'Transverse';

            % Create ElbowEditField_8
            app.ElbowEditField_8 = uieditfield(app.TossingcommandsPanel, 'numeric');
            app.ElbowEditField_8.Limits = [0 2.35];
            app.ElbowEditField_8.Position = [83 43 100 22];
            app.ElbowEditField_8.Value = 1.6;

            % Create ElbowEditField_8Label
            app.ElbowEditField_8Label = uilabel(app.TossingcommandsPanel);
            app.ElbowEditField_8Label.HorizontalAlignment = 'right';
            app.ElbowEditField_8Label.Position = [8 43 38 22];
            app.ElbowEditField_8Label.Text = 'Elbow';

            % Create TossButton
            app.TossButton = uibutton(app.TossingcommandsPanel, 'state');
            app.TossButton.ValueChangedFcn = createCallbackFcn(app, @TossButtonValueChanged, true);
            app.TossButton.Text = 'Toss';
            app.TossButton.Position = [84 8 100 22];

            % Create HomeButton_5
            app.HomeButton_5 = uibutton(app.HumaninteractionTab, 'push');
            app.HomeButton_5.ButtonPushedFcn = createCallbackFcn(app, @HomeButton_5Pushed, true);
            app.HomeButton_5.Position = [509 51 100 22];
            app.HomeButton_5.Text = 'Home';

            % Create StartButton_4
            app.StartButton_4 = uibutton(app.HumaninteractionTab, 'push');
            app.StartButton_4.ButtonPushedFcn = createCallbackFcn(app, @StartButton_4Pushed, true);
            app.StartButton_4.Position = [509 18 100 22];
            app.StartButton_4.Text = 'Start';

            % Create InteractButton
            app.InteractButton = uibutton(app.HumaninteractionTab, 'push');
            app.InteractButton.Position = [444 121 100 22];
            app.InteractButton.Text = 'Interact';

            % Create LivecatchingcommandsPanel
            app.LivecatchingcommandsPanel = uipanel(app.HumaninteractionTab);
            app.LivecatchingcommandsPanel.Title = 'Live catching commands';
            app.LivecatchingcommandsPanel.Position = [292 167 300 253];

            % Create LimitxminEditField
            app.LimitxminEditField = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.LimitxminEditField.Limits = [-1.5708 1.5708];
            app.LimitxminEditField.Position = [91 202 45 22];
            app.LimitxminEditField.Value = 0.08;

            % Create LimitxminEditFieldLabel
            app.LimitxminEditFieldLabel = uilabel(app.LivecatchingcommandsPanel);
            app.LimitxminEditFieldLabel.HorizontalAlignment = 'right';
            app.LimitxminEditFieldLabel.Position = [9 202 71 22];
            app.LimitxminEditFieldLabel.Text = 'Limit x (min)';

            % Create LimityminEditField
            app.LimityminEditField = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.LimityminEditField.Limits = [-0.8 0.8];
            app.LimityminEditField.Position = [92 168 45 22];

            % Create LimityminEditFieldLabel
            app.LimityminEditFieldLabel = uilabel(app.LivecatchingcommandsPanel);
            app.LimityminEditFieldLabel.HorizontalAlignment = 'right';
            app.LimityminEditFieldLabel.Position = [10 168 71 22];
            app.LimityminEditFieldLabel.Text = 'Limit y (min)';

            % Create CatchingheightEditField_3
            app.CatchingheightEditField_3 = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.CatchingheightEditField_3.Limits = [0 2.35];
            app.CatchingheightEditField_3.Position = [130 44 113 22];
            app.CatchingheightEditField_3.Value = 1;

            % Create CatchingheightEditField_3Label
            app.CatchingheightEditField_3Label = uilabel(app.LivecatchingcommandsPanel);
            app.CatchingheightEditField_3Label.HorizontalAlignment = 'right';
            app.CatchingheightEditField_3Label.Position = [19 44 89 22];
            app.CatchingheightEditField_3Label.Text = 'Catching height';

            % Create CatchButton_2
            app.CatchButton_2 = uibutton(app.LivecatchingcommandsPanel, 'state');
            app.CatchButton_2.ValueChangedFcn = createCallbackFcn(app, @CatchButton_2ValueChanged, true);
            app.CatchButton_2.Text = 'Catch';
            app.CatchButton_2.Position = [101 9 100 22];

            % Create LimitxmaxEditField
            app.LimitxmaxEditField = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.LimitxmaxEditField.Limits = [-1.5708 1.5708];
            app.LimitxmaxEditField.Position = [242 202 45 22];
            app.LimitxmaxEditField.Value = 0.57;

            % Create LimitxmaxEditFieldLabel
            app.LimitxmaxEditFieldLabel = uilabel(app.LivecatchingcommandsPanel);
            app.LimitxmaxEditFieldLabel.HorizontalAlignment = 'right';
            app.LimitxmaxEditFieldLabel.Position = [157 202 74 22];
            app.LimitxmaxEditFieldLabel.Text = 'Limit x (max)';

            % Create LimitymaxEditField
            app.LimitymaxEditField = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.LimitymaxEditField.Limits = [-0.8 0.8];
            app.LimitymaxEditField.Position = [242 168 45 22];
            app.LimitymaxEditField.Value = 0.485;

            % Create LimitymaxEditFieldLabel
            app.LimitymaxEditFieldLabel = uilabel(app.LivecatchingcommandsPanel);
            app.LimitymaxEditFieldLabel.HorizontalAlignment = 'right';
            app.LimitymaxEditFieldLabel.Position = [157 168 74 22];
            app.LimitymaxEditFieldLabel.Text = 'Limit y (max)';

            % Create CatchingtimeEditField
            app.CatchingtimeEditField = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.CatchingtimeEditField.Limits = [0 60];
            app.CatchingtimeEditField.Position = [130 79 113 22];
            app.CatchingtimeEditField.Value = 2;

            % Create CatchingtimeEditFieldLabel
            app.CatchingtimeEditFieldLabel = uilabel(app.LivecatchingcommandsPanel);
            app.CatchingtimeEditFieldLabel.HorizontalAlignment = 'right';
            app.CatchingtimeEditFieldLabel.Position = [18 79 79 22];
            app.CatchingtimeEditFieldLabel.Text = 'Catching time';

            % Create LimitzEditField
            app.LimitzEditField = uieditfield(app.LivecatchingcommandsPanel, 'numeric');
            app.LimitzEditField.Limits = [1 2.5];
            app.LimitzEditField.Position = [92 135 45 22];
            app.LimitzEditField.Value = 1.9;

            % Create LimitzEditFieldLabel
            app.LimitzEditFieldLabel = uilabel(app.LivecatchingcommandsPanel);
            app.LimitzEditFieldLabel.HorizontalAlignment = 'right';
            app.LimitzEditFieldLabel.Position = [10 135 40 22];
            app.LimitzEditFieldLabel.Text = 'Limit z';

            % Create HumaninteractionLabel
            app.HumaninteractionLabel = uilabel(app.HumaninteractionTab);
            app.HumaninteractionLabel.FontSize = 20;
            app.HumaninteractionLabel.FontWeight = 'bold';
            app.HumaninteractionLabel.Position = [225 419 181 24];
            app.HumaninteractionLabel.Text = 'Human interaction';

            % Create EstimationcatchingcommandsPanel
            app.EstimationcatchingcommandsPanel = uipanel(app.HumaninteractionTab);
            app.EstimationcatchingcommandsPanel.Title = 'Estimation catching commands';
            app.EstimationcatchingcommandsPanel.Position = [20 61 208 161];

            % Create SamplingthEditField
            app.SamplingthEditField = uieditfield(app.EstimationcatchingcommandsPanel, 'numeric');
            app.SamplingthEditField.Limits = [-1.5708 1.5708];
            app.SamplingthEditField.Position = [95 110 100 22];
            app.SamplingthEditField.Value = 1.24;

            % Create SamplingthEditFieldLabel
            app.SamplingthEditFieldLabel = uilabel(app.EstimationcatchingcommandsPanel);
            app.SamplingthEditFieldLabel.HorizontalAlignment = 'right';
            app.SamplingthEditFieldLabel.Position = [4 110 69 22];
            app.SamplingthEditFieldLabel.Text = 'Sampling th';

            % Create CatchheightEditField
            app.CatchheightEditField = uieditfield(app.EstimationcatchingcommandsPanel, 'numeric');
            app.CatchheightEditField.Limits = [-0.5 1.5];
            app.CatchheightEditField.Position = [95 76 100 22];
            app.CatchheightEditField.Value = 1;

            % Create CatchheightEditFieldLabel
            app.CatchheightEditFieldLabel = uilabel(app.EstimationcatchingcommandsPanel);
            app.CatchheightEditFieldLabel.HorizontalAlignment = 'right';
            app.CatchheightEditFieldLabel.Position = [4 76 73 22];
            app.CatchheightEditFieldLabel.Text = 'Catch height';

            % Create CatchButton_3
            app.CatchButton_3 = uibutton(app.EstimationcatchingcommandsPanel, 'state');
            app.CatchButton_3.ValueChangedFcn = createCallbackFcn(app, @CatchButton_3ValueChanged, true);
            app.CatchButton_3.Text = 'Catch';
            app.CatchButton_3.Position = [61 39 100 22];

            % Create HardcodedJuggleTab
            app.HardcodedJuggleTab = uitab(app.TabGroup);
            app.HardcodedJuggleTab.Title = 'Hard coded Juggle';

            % Create StartPanel
            app.StartPanel = uipanel(app.HardcodedJuggleTab);
            app.StartPanel.Title = 'Start';
            app.StartPanel.Position = [1 282 204 161];

            % Create ShoulderEditField_2
            app.ShoulderEditField_2 = uieditfield(app.StartPanel, 'numeric');
            app.ShoulderEditField_2.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_2.Position = [83 110 100 22];

            % Create ShoulderEditField_2Label
            app.ShoulderEditField_2Label = uilabel(app.StartPanel);
            app.ShoulderEditField_2Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_2Label.Position = [8 110 54 22];
            app.ShoulderEditField_2Label.Text = 'Shoulder';

            % Create TransverseEditField_2
            app.TransverseEditField_2 = uieditfield(app.StartPanel, 'numeric');
            app.TransverseEditField_2.Limits = [-0.8 0.8];
            app.TransverseEditField_2.Position = [83 76 100 22];

            % Create TransverseEditField_2Label
            app.TransverseEditField_2Label = uilabel(app.StartPanel);
            app.TransverseEditField_2Label.HorizontalAlignment = 'right';
            app.TransverseEditField_2Label.Position = [8 76 65 22];
            app.TransverseEditField_2Label.Text = 'Transverse';

            % Create ElbowEditField_2
            app.ElbowEditField_2 = uieditfield(app.StartPanel, 'numeric');
            app.ElbowEditField_2.Limits = [0 4.7124];
            app.ElbowEditField_2.Position = [83 43 100 22];
            app.ElbowEditField_2.Value = 0.5;

            % Create ElbowEditField_2Label
            app.ElbowEditField_2Label = uilabel(app.StartPanel);
            app.ElbowEditField_2Label.HorizontalAlignment = 'right';
            app.ElbowEditField_2Label.Position = [8 43 38 22];
            app.ElbowEditField_2Label.Text = 'Elbow';

            % Create TossPanel
            app.TossPanel = uipanel(app.HardcodedJuggleTab);
            app.TossPanel.Title = 'Toss';
            app.TossPanel.Position = [1 72 204 161];

            % Create ShoulderEditField_3
            app.ShoulderEditField_3 = uieditfield(app.TossPanel, 'numeric');
            app.ShoulderEditField_3.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_3.Position = [83 110 100 22];
            app.ShoulderEditField_3.Value = 0.2;

            % Create ShoulderEditField_3Label
            app.ShoulderEditField_3Label = uilabel(app.TossPanel);
            app.ShoulderEditField_3Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_3Label.Position = [8 110 54 22];
            app.ShoulderEditField_3Label.Text = 'Shoulder';

            % Create TransverseEditField_3
            app.TransverseEditField_3 = uieditfield(app.TossPanel, 'numeric');
            app.TransverseEditField_3.Limits = [-0.8 0.8];
            app.TransverseEditField_3.Position = [83 76 100 22];

            % Create TransverseEditField_3Label
            app.TransverseEditField_3Label = uilabel(app.TossPanel);
            app.TransverseEditField_3Label.HorizontalAlignment = 'right';
            app.TransverseEditField_3Label.Position = [8 76 65 22];
            app.TransverseEditField_3Label.Text = 'Transverse';

            % Create ElbowEditField_3
            app.ElbowEditField_3 = uieditfield(app.TossPanel, 'numeric');
            app.ElbowEditField_3.Limits = [0 4.7124];
            app.ElbowEditField_3.Position = [83 43 100 22];
            app.ElbowEditField_3.Value = 2;

            % Create ElbowEditField_3Label
            app.ElbowEditField_3Label = uilabel(app.TossPanel);
            app.ElbowEditField_3Label.HorizontalAlignment = 'right';
            app.ElbowEditField_3Label.Position = [8 43 38 22];
            app.ElbowEditField_3Label.Text = 'Elbow';

            % Create CatchPanel
            app.CatchPanel = uipanel(app.HardcodedJuggleTab);
            app.CatchPanel.Title = 'Catch';
            app.CatchPanel.Position = [204 72 204 161];

            % Create ShoulderEditField_4
            app.ShoulderEditField_4 = uieditfield(app.CatchPanel, 'numeric');
            app.ShoulderEditField_4.Limits = [-1.5708 1.5708];
            app.ShoulderEditField_4.Position = [83 110 100 22];
            app.ShoulderEditField_4.Value = 0.2;

            % Create ShoulderEditField_4Label
            app.ShoulderEditField_4Label = uilabel(app.CatchPanel);
            app.ShoulderEditField_4Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_4Label.Position = [8 110 54 22];
            app.ShoulderEditField_4Label.Text = 'Shoulder';

            % Create TransverseEditField_4
            app.TransverseEditField_4 = uieditfield(app.CatchPanel, 'numeric');
            app.TransverseEditField_4.Limits = [-0.8 0.8];
            app.TransverseEditField_4.Position = [83 76 100 22];
            app.TransverseEditField_4.Value = -0.1;

            % Create TransverseEditField_4Label
            app.TransverseEditField_4Label = uilabel(app.CatchPanel);
            app.TransverseEditField_4Label.HorizontalAlignment = 'right';
            app.TransverseEditField_4Label.Position = [8 76 65 22];
            app.TransverseEditField_4Label.Text = 'Transverse';

            % Create ElbowEditField_4
            app.ElbowEditField_4 = uieditfield(app.CatchPanel, 'numeric');
            app.ElbowEditField_4.Limits = [0 4.7124];
            app.ElbowEditField_4.Position = [83 43 100 22];
            app.ElbowEditField_4.Value = 2;

            % Create ElbowEditField_4Label
            app.ElbowEditField_4Label = uilabel(app.CatchPanel);
            app.ElbowEditField_4Label.HorizontalAlignment = 'right';
            app.ElbowEditField_4Label.Position = [8 43 38 22];
            app.ElbowEditField_4Label.Text = 'Elbow';

            % Create JuggleButton
            app.JuggleButton = uibutton(app.HardcodedJuggleTab, 'push');
            app.JuggleButton.ButtonPushedFcn = createCallbackFcn(app, @JuggleButtonPushed, true);
            app.JuggleButton.Position = [429 72 100 22];
            app.JuggleButton.Text = 'Juggle';

            % Create GotostartButton
            app.GotostartButton = uibutton(app.HardcodedJuggleTab, 'push');
            app.GotostartButton.ButtonPushedFcn = createCallbackFcn(app, @GotostartButtonPushed, true);
            app.GotostartButton.Position = [229 282 100 22];
            app.GotostartButton.Text = 'Go to start';

            % Create IKTab
            app.IKTab = uitab(app.TabGroup);
            app.IKTab.Title = 'IK';

            % Create TestIKPanel
            app.TestIKPanel = uipanel(app.IKTab);
            app.TestIKPanel.Title = 'Test IK';
            app.TestIKPanel.Position = [-1 226 196 217];

            % Create ShoulderEditField_6Label
            app.ShoulderEditField_6Label = uilabel(app.TestIKPanel);
            app.ShoulderEditField_6Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_6Label.Position = [-2 171 54 22];
            app.ShoulderEditField_6Label.Text = 'Shoulder';

            % Create ShoulderEditField_6
            app.ShoulderEditField_6 = uieditfield(app.TestIKPanel, 'numeric');
            app.ShoulderEditField_6.ValueChangedFcn = createCallbackFcn(app, @ShoulderEditField_6ValueChanged, true);
            app.ShoulderEditField_6.Editable = 'off';
            app.ShoulderEditField_6.Position = [78 171 100 22];

            % Create TransverseEditField_6Label
            app.TransverseEditField_6Label = uilabel(app.TestIKPanel);
            app.TransverseEditField_6Label.HorizontalAlignment = 'right';
            app.TransverseEditField_6Label.Position = [-2 139 65 22];
            app.TransverseEditField_6Label.Text = 'Transverse';

            % Create TransverseEditField_6
            app.TransverseEditField_6 = uieditfield(app.TestIKPanel, 'numeric');
            app.TransverseEditField_6.Editable = 'off';
            app.TransverseEditField_6.Position = [78 139 100 22];

            % Create ElbowEditField_6Label
            app.ElbowEditField_6Label = uilabel(app.TestIKPanel);
            app.ElbowEditField_6Label.HorizontalAlignment = 'right';
            app.ElbowEditField_6Label.Position = [-2 106 38 22];
            app.ElbowEditField_6Label.Text = 'Elbow';

            % Create ElbowEditField_6
            app.ElbowEditField_6 = uieditfield(app.TestIKPanel, 'numeric');
            app.ElbowEditField_6.Editable = 'off';
            app.ElbowEditField_6.Position = [78 106 100 22];

            % Create CalculateButton
            app.CalculateButton = uibutton(app.TestIKPanel, 'push');
            app.CalculateButton.ButtonPushedFcn = createCallbackFcn(app, @CalculateButtonPushed, true);
            app.CalculateButton.Position = [78 76 100 22];
            app.CalculateButton.Text = 'Calculate';

            % Create PublishButton_3
            app.PublishButton_3 = uibutton(app.TestIKPanel, 'push');
            app.PublishButton_3.ButtonPushedFcn = createCallbackFcn(app, @PublishButton_3Pushed, true);
            app.PublishButton_3.Position = [78 42 100 22];
            app.PublishButton_3.Text = 'Publish';

            % Create CalculatePublishButton
            app.CalculatePublishButton = uibutton(app.TestIKPanel, 'push');
            app.CalculatePublishButton.ButtonPushedFcn = createCallbackFcn(app, @CalculatePublishButtonPushed, true);
            app.CalculatePublishButton.Position = [68 10 120 22];
            app.CalculatePublishButton.Text = 'Calculate & Publish';

            % Create StatusPanel
            app.StatusPanel = uipanel(app.IKTab);
            app.StatusPanel.Title = 'Status';
            app.StatusPanel.Position = [508 323 121 120];

            % Create AllclearLampLabel
            app.AllclearLampLabel = uilabel(app.StatusPanel);
            app.AllclearLampLabel.HorizontalAlignment = 'right';
            app.AllclearLampLabel.Position = [7 9 48 22];
            app.AllclearLampLabel.Text = 'All clear';

            % Create AllclearLamp
            app.AllclearLamp = uilamp(app.StatusPanel);
            app.AllclearLamp.Position = [93 10 20 20];

            % Create CatchzoneLampLabel
            app.CatchzoneLampLabel = uilabel(app.StatusPanel);
            app.CatchzoneLampLabel.HorizontalAlignment = 'right';
            app.CatchzoneLampLabel.Position = [3 71 66 22];
            app.CatchzoneLampLabel.Text = 'Catch zone';

            % Create CatchzoneLamp
            app.CatchzoneLamp = uilamp(app.StatusPanel);
            app.CatchzoneLamp.Position = [93 72 20 20];

            % Create JointstatesLampLabel
            app.JointstatesLampLabel = uilabel(app.StatusPanel);
            app.JointstatesLampLabel.HorizontalAlignment = 'right';
            app.JointstatesLampLabel.Position = [3 42 66 22];
            app.JointstatesLampLabel.Text = 'Joint states';

            % Create JointstatesLamp
            app.JointstatesLamp = uilamp(app.StatusPanel);
            app.JointstatesLamp.Position = [93 41 20 20];

            % Create CatchPanel_2
            app.CatchPanel_2 = uipanel(app.IKTab);
            app.CatchPanel_2.Title = 'Catch';
            app.CatchPanel_2.Position = [194 226 260 217];

            % Create TossingheightEditFieldLabel
            app.TossingheightEditFieldLabel = uilabel(app.CatchPanel_2);
            app.TossingheightEditFieldLabel.HorizontalAlignment = 'right';
            app.TossingheightEditFieldLabel.Position = [8 171 82 22];
            app.TossingheightEditFieldLabel.Text = 'Tossing height';

            % Create TossingheightEditField
            app.TossingheightEditField = uieditfield(app.CatchPanel_2, 'numeric');
            app.TossingheightEditField.Position = [138 171 100 22];
            app.TossingheightEditField.Value = 1.24;

            % Create CatchingheightEditFieldLabel
            app.CatchingheightEditFieldLabel = uilabel(app.CatchPanel_2);
            app.CatchingheightEditFieldLabel.HorizontalAlignment = 'right';
            app.CatchingheightEditFieldLabel.Position = [4 139 89 22];
            app.CatchingheightEditFieldLabel.Text = 'Catching height';

            % Create CatchingheightEditField
            app.CatchingheightEditField = uieditfield(app.CatchPanel_2, 'numeric');
            app.CatchingheightEditField.Position = [138 139 100 22];
            app.CatchingheightEditField.Value = 1;

            % Create CatchButton
            app.CatchButton = uibutton(app.CatchPanel_2, 'push');
            app.CatchButton.ButtonPushedFcn = createCallbackFcn(app, @CatchButtonPushed, true);
            app.CatchButton.Position = [71 97 100 22];
            app.CatchButton.Text = 'Catch';

            % Create HomeButton_2
            app.HomeButton_2 = uibutton(app.IKTab, 'push');
            app.HomeButton_2.ButtonPushedFcn = createCallbackFcn(app, @HomeButton_2Pushed, true);
            app.HomeButton_2.Position = [516 281 100 22];
            app.HomeButton_2.Text = 'Home';

            % Create GotopointPanel
            app.GotopointPanel = uipanel(app.IKTab);
            app.GotopointPanel.Title = 'Go to point';
            app.GotopointPanel.Position = [-1 75 454 152];

            % Create xEditFieldLabel
            app.xEditFieldLabel = uilabel(app.GotopointPanel);
            app.xEditFieldLabel.HorizontalAlignment = 'right';
            app.xEditFieldLabel.Position = [30 106 25 22];
            app.xEditFieldLabel.Text = 'x';

            % Create xEditField
            app.xEditField = uieditfield(app.GotopointPanel, 'numeric');
            app.xEditField.Position = [78 106 100 22];

            % Create yEditFieldLabel
            app.yEditFieldLabel = uilabel(app.GotopointPanel);
            app.yEditFieldLabel.HorizontalAlignment = 'right';
            app.yEditFieldLabel.Position = [28 74 25 22];
            app.yEditFieldLabel.Text = 'y';

            % Create yEditField
            app.yEditField = uieditfield(app.GotopointPanel, 'numeric');
            app.yEditField.Position = [78 74 100 22];

            % Create zEditFieldLabel
            app.zEditFieldLabel = uilabel(app.GotopointPanel);
            app.zEditFieldLabel.HorizontalAlignment = 'right';
            app.zEditFieldLabel.Position = [28 41 25 22];
            app.zEditFieldLabel.Text = 'z';

            % Create zEditField
            app.zEditField = uieditfield(app.GotopointPanel, 'numeric');
            app.zEditField.Position = [78 41 100 22];
            app.zEditField.Value = 1;

            % Create GoButton
            app.GoButton = uibutton(app.GotopointPanel, 'push');
            app.GoButton.ButtonPushedFcn = createCallbackFcn(app, @GoButtonPushed, true);
            app.GoButton.Position = [78 11 100 22];
            app.GoButton.Text = 'Go';

            % Create ShoulderEditField_7Label
            app.ShoulderEditField_7Label = uilabel(app.GotopointPanel);
            app.ShoulderEditField_7Label.HorizontalAlignment = 'right';
            app.ShoulderEditField_7Label.Position = [227 95 54 22];
            app.ShoulderEditField_7Label.Text = 'Shoulder';

            % Create ShoulderEditField_7
            app.ShoulderEditField_7 = uieditfield(app.GotopointPanel, 'numeric');
            app.ShoulderEditField_7.Editable = 'off';
            app.ShoulderEditField_7.Position = [307 95 100 22];

            % Create TransverseEditField_7Label
            app.TransverseEditField_7Label = uilabel(app.GotopointPanel);
            app.TransverseEditField_7Label.HorizontalAlignment = 'right';
            app.TransverseEditField_7Label.Position = [227 63 65 22];
            app.TransverseEditField_7Label.Text = 'Transverse';

            % Create TransverseEditField_7
            app.TransverseEditField_7 = uieditfield(app.GotopointPanel, 'numeric');
            app.TransverseEditField_7.Editable = 'off';
            app.TransverseEditField_7.Position = [307 63 100 22];

            % Create ElbowEditField_7Label
            app.ElbowEditField_7Label = uilabel(app.GotopointPanel);
            app.ElbowEditField_7Label.HorizontalAlignment = 'right';
            app.ElbowEditField_7Label.Position = [227 30 38 22];
            app.ElbowEditField_7Label.Text = 'Elbow';

            % Create ElbowEditField_7
            app.ElbowEditField_7 = uieditfield(app.GotopointPanel, 'numeric');
            app.ElbowEditField_7.Editable = 'off';
            app.ElbowEditField_7.Position = [307 30 100 22];

            % Create FollowBallButton
            app.FollowBallButton = uibutton(app.IKTab, 'push');
            app.FollowBallButton.ButtonPushedFcn = createCallbackFcn(app, @FollowBallButtonPushed, true);
            app.FollowBallButton.Position = [27 32 100 22];
            app.FollowBallButton.Text = 'FollowBall';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = jurp_app_V2_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end