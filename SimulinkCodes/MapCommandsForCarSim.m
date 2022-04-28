function [steer_output, speed, brake] = fcn(steer, parking_complete)
brake = 0;
steer_output= -steer * 180/pi*15;

if parking_complete
    speed = 0;
    brake = 3;
else
    speed=5;
end