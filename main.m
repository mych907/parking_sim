start_pos = 2; % 1 or 2
parking_space = 1; % 1 ~ 3

start_pos = Start(start_pos);
map = InitializeMap(parking_space);
sim("ParkingTest1.slx", 8)