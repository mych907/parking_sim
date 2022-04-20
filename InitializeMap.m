function map = InitializeMap(parking_space)
res = 100;
lanethickness = 0.2;
parkingwidth = 2.3;
parkinglength = 5;

map = zeros(round(res*(parkingwidth*5 + lanethickness)),res*(5*3 + lanethickness/2));

for i = 1:5
    if parking_space ~= i
        map = TargetOccupancy(map, parkingwidth * (i-1) + (parkingwidth + lanethickness)/2, (parkinglength + lanethickness)/2);
    end
end

map = TargetOccupancySafety(map);
% map = flipud(map);
occupancyTest = occupancyMap(flipud(map),res);
figure(1);
show(occupancyTest)


function target_occupancy = TargetOccupancy(map, y, x)
res = 100;
targetwidth = 1.8;
targetlength = 2.6;

map(round(res*(y - targetwidth/2)):round(res*(y + targetwidth/2)), round(res*(x - targetlength/2)):round(res*(x + targetlength/2))) = 1;

x_right = x + targetlength/2;
x_left = x - targetlength/2;
y_up = y + targetwidth/2;
y_down = y - targetwidth/2;

map = TargetOccupancySafetyCircle(map, x_right, y_up);
map = TargetOccupancySafetyCircle(map, x_left, y_up);
map = TargetOccupancySafetyCircle(map, x_right, y_down);
map = TargetOccupancySafetyCircle(map, x_left, y_down);

target_occupancy = map;

function target_occupancy_safety_circle = TargetOccupancySafetyCircle(map, x, y)
res = 100;
egowidth_h = 0.9 * 1.5;
if round(res*(x - egowidth_h)) > 0 && round(res*(x + egowidth_h)) < 1510
    for i = round(res*(x - egowidth_h)):round(res*(x + egowidth_h))
        if round(res*(y - sqrt(egowidth_h^2 - (i/100-x)^2))) > 0 && round(res*(y + sqrt(egowidth_h^2 - (i/100-x)^2))) < 1170
            for j = round(res*(y - sqrt(egowidth_h^2 - (i/100-x)^2))):round(res*(y + sqrt(egowidth_h^2 - (i/100-x)^2)))
                if map(j,i) == 0
                    map(j,i) = 0.8;
                end
            end    
        end
    end
end
target_occupancy_safety_circle = map;

function target_occupancy_safety = TargetOccupancySafety(map)
res = 100;
egowidth_h = 0.9 * 1.5;
dx = round(res*[egowidth_h, -egowidth_h, 0, 0]);
dy = round(res*[0, 0, egowidth_h, -egowidth_h]);

for i = 1: 1170
    for j = 1: 1510
        if map(i,j) == 1
            for k = 1:4
                if i+dy(k) > 0 && j+dx(k) > 0 && i+dy(k) < 1170 && j+dx(k) < 1510
                    if map(i+dy(k), j+dx(k)) ~= 1
                        map(i+dy(k), j+dx(k)) = 0.8;
                    end
                end
            end            
        end
    end
end
target_occupancy_safety = map;
