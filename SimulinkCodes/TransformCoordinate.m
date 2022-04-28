function [x_t, y_t, yaw_t] = TransformCoordinate(x, y, yaw, start_pos)
theta = pi/2;

x_t = x*cos(theta) - y*sin(theta) + start_pos(1);
y_t = x*sin(theta) + y*cos(theta) + start_pos(2);

if -180 < yaw && yaw < 90
    yaw_t = (yaw + 90)*pi/180;
else
    yaw_t = (yaw - 270)*pi/180;
end

