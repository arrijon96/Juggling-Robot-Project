#include "mbed.h"
#include "encoder.h"
#include <ros.h>
#include "std_msgs/Float64.h"
#include "geometry_msgs/Vector3.h"
#include "PID.h"

#define MAXPOS1 1152
#define MAXPOS2 10656
#define PI 3.141592653589793
#define RATE 0.01

float target_pos1 = 0;
float target_pos2 = 0;
PID controller1(5.0, 0.0, 0.0, RATE); //Kc, Ti, Td, Interval
PID controller2(7.0, 0, 0, RATE); //20, 0, 30


ros::NodeHandle nh;
//std_msgs::Float64 info;
std_msgs::Float64 enc1;
std_msgs::Float64 enc2;

ros::Publisher pub1("encoder1", &enc1);
ros::Publisher pub2("encoder2", &enc2);
//ros::Publisher pubi("info", &info);

void cb1(const geometry_msgs::Vector3& ref) {target_pos1 = MAXPOS1*ref.x/(2*PI);} 
void cb2(const geometry_msgs::Vector3& ref) {target_pos2 = MAXPOS2*ref.y/(2*PI);}

ros::Subscriber<geometry_msgs::Vector3> sub1("reference1", cb1);
ros::Subscriber<geometry_msgs::Vector3> sub2("reference2", cb2);

DigitalOut  dir_pin1(D11);
PwmOut  pwm_pin1(D10);

DigitalOut  dir_pin2(D9);
PwmOut  pwm_pin2(D8);

Encoder encoder1(PA_0,PA_1);
Encoder encoder2(D15,D14);

void motor_control(float real_pos, float target_pos, int motor)
{   
    
    if (motor==1)
    {
        if (target_pos > real_pos)
            {
                controller1.setSetPoint((target_pos-real_pos)/MAXPOS1);
                pwm_pin1 = controller1.compute();
                dir_pin1 = 1;
            }
        else if (target_pos < real_pos)
            {
                controller1.setSetPoint(-(target_pos-real_pos)/MAXPOS1);
                pwm_pin1 = controller1.compute();
                dir_pin1 = 0;
            }
        else if (target_pos == real_pos)
        {
            controller1.setSetPoint(0);
            pwm_pin1 = controller1.compute();
            }
    }
    else if (motor == 2)
    {
        if (target_pos > real_pos)
            {
                controller2.setSetPoint((target_pos-real_pos)/MAXPOS2);
                pwm_pin2 = controller2.compute();
                dir_pin2 = 0;
            }
        else if (target_pos < real_pos)
            {
                controller2.setSetPoint(-(target_pos-real_pos)/MAXPOS2);
                pwm_pin2 = controller2.compute();
                dir_pin2 = 1;
            }
        else if (target_pos == real_pos)
        {
            controller2.setSetPoint(0);
            pwm_pin2 = controller2.compute();
            
        }  
    }
}

int main() {
    nh.initNode();
    nh.advertise(pub1);
    nh.advertise(pub2);
    //nh.advertise(pubi);
    nh.subscribe(sub1);
    nh.subscribe(sub2);
    
    
        while (1) {
            enc1.data = encoder1.getPosition();
            motor_control(enc1.data, target_pos1, 1);
            
            
            enc2.data = encoder2.getPosition();
            motor_control(enc2.data, target_pos2, 2);
            
            //info.data = (target_pos2-enc2.data)/MAXPOS2;
            //pubi.publish ( &info);
            
            enc1.data = encoder1.getPosition()*2*PI/MAXPOS1;
            pub1.publish( &enc1 );
            
            
            enc2.data = encoder2.getPosition()*2*PI/MAXPOS2;
            pub2.publish( &enc2 );
            
            nh.spinOnce();
            
            
            wait(RATE);
    }
}