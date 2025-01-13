cdraSystem = CDRA();

totalSimulationTime = 150 * 60;
timeStep = 600;                 % [sec] 10min

disp('Starting CDRA simulation...');
for currentTime = 0:timeStep:totalSimulationTime
    disp(['Current Time: ', num2str(currentTime), ' seconds']);
    
    % CDRAmethods
    cdraSystem.exec(currentTime);
    
    % pause(0.5);
end

disp('CDRA simulation completed.');
