# parking_sim
MATLAB/Simulink based Parking simulator. Tested in MATLAB2020b and CarSim 2021.1.

![simul](https://github.com/mych907/parking_sim/blob/main/SimulinkDesign.jpg?raw=true)

Map: Occupancy Grid

Path planning: A* algorithm

Path tracking: Pure pursuit

![demo](https://github.com/mych907/parking_sim/blob/main/parkingsim.gif?raw=true)

This project requires CarSim license. A bicycle model based simulation (without CarSim) will be uploaded upon request.

## Running the model

1. Import .cpar file from CarSim and "Send to Simulink".

2. Edit start_pos and parking_space for preference. Not all conditions have been optimized.

3. Run main.m from MATLAB editor window.


The codes for each MATLAB functions are in the SimulinkCodes folder.
