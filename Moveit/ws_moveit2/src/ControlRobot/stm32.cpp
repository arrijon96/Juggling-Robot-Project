#include "mbed.h"
#include "encoder.h"
#include <ros.h>
#include "std_msgs/Float64.h"

#define MAXPOS1 1152
#define MAXPOS2 1536
#define PI 3.141592653589793

float target_pos1 = 0;
float target_pos2 = 0;
float P1 = 0; 
float P2 = 10;

ros::NodeHandle nh;
std_msgs::Float64 enc1;
std_msgs::Float64 enc2;
std_msgs::Float64 tp2;

ros::Publisher pub1("encoder1", &enc1);
ros::Publisher pub2("encoder2", &enc2);


void cb1(const std_msgs::Float64& ref1) {target_pos1 = MAXPOS1*ref1.data/(2*PI);} 

ros::Subscriber<std_msgs::Float64> sub1("reference1", cb1);
ros::Subscriber<std_msgs::Float64> sub2("reference2", cb2);

DigitalOut  dir_pin(D9);
PwmOut  pwm_pin(D8);
Encoder encoder1(PA_0,PA_1);
Encoder encoder2(PB_3,PA_10);

void motor_control(float real_pos, float target_pos, int motor)
{   
    float P;
    if (motor==1){P = P1;}
    else if (motor == 2){P = P2;}
    
    if (target_pos > real_pos)
        {
            pwm_pin = (target_pos-real_pos)/MAXPOS1*P;
            dir_pin = 0;
        }
    else if (target_pos < real_pos)
        {
            pwm_pin = -(target_pos-real_pos)/MAXPOS2*P;
            dir_pin = 1;
        }
    else if (target_pos == real_pos){pwm_pin = 0;}
}

int main() {
    nh.initNode();
    nh.advertise(pub1);
    nh.advertise(pub2);
    nh.subscribe(sub1);
    nh.subscribe(sub2);
        while (1) {
            enc1.data = encoder1.getPosition();
            pub1.publish( &enc1 );
            
            enc2.data = encoder2.getPosition();
            pub2.publish( &enc2 );
            
            nh.spinOnce();
            
            //motor_control(enc1.data, target_pos1, 1);
            motor_control(enc2.data, target_pos2, 2);
            wait_ms(10);
    }
}