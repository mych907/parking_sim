function start_pos = Start(pos)
parkingwidth = 2.3;
parkinglength = 5;

start_pos = zeros(2);
if pos == 1
    start_pos = [parkinglength*2, parkingwidth];
elseif pos == 2
    start_pos = [parkinglength*2.5, parkingwidth];
end
    
