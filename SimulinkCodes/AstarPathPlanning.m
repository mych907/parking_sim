function [path, parking_complete] = fcn(x, y, map, parking_space)
res=100;
lanethickness = 0.2;
parkingwidth = 2.3;
parkinglength = 5;

goalx = res*(parkinglength + lanethickness)/2;
goaly = res*(parkingwidth*(parking_space-1) + (parkingwidth + lanethickness)/2);

ego_x = round(res*x);
ego_y = round(res*y);

x_path = zeros(556,1);
y_path = zeros(556,1);
x_path_global = zeros(556,1);
y_path_global = zeros(556,1);

parking_complete = 0;
if (goalx-ego_x)^2 + (goaly-ego_y)^2 < 2000
    parking_complete = 1;
end

for n = 1:556 % 2.78 m/s * 1s *2 preview time
    min = 1000000;
    min_i = ego_x;
    min_j = ego_y;
    for i = ego_x - 1: ego_x + 1
        for j = ego_y - 1: ego_y + 1
            buffer = sqrt((goalx - i)^2 + (goaly - j)^2);
            buffer = buffer + map(j,i)*buffer;
            if (buffer < min)
                min = buffer;
                min_i = i;
                min_j = j;
            end
        end
    end
    ego_x = min_i;
    ego_y = min_j;
    x_path(n) = (ego_x - round(res*x));
    y_path(n) = (ego_y - round(res*y));
    x_path_global(n) = ego_x;
    y_path_global(n) = ego_y;
end

hold on
plot(x_path_global/res,y_path_global/res, 'k')
hold off

path = [x_path, y_path];
