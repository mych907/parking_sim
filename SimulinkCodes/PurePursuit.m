function steering_angle  = fcn(path, yaw)
res=100;
ld = 4*0.5*res;   % Look ahead distance as a hyperparameter, 0.5s preview time
L = 2.35*res; % wheel base
rear_center = [- L/2*cos(yaw), - L/2*sin(yaw)]; % Rear wheels' center

min = 1000000;
min_n = 1;
for n = 1:556
    buffer = sqrt((rear_center(1)-path(n,1))^2 + (rear_center(2)-path(n,2))^2);
    if (abs(buffer - ld) < min)
        min = abs(buffer - ld);
        min_n = n;
    end
end

p_x = path(min_n,1);
p_y = path(min_n,2);

alpha = atan(p_y/p_x) - yaw;
steering_angle = atan(2*L*sin(alpha)/ld);