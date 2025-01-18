classdef CDRA
    properties
        % Adsorption/desorption cycle state (1 or 2)
        iCycleActive = 1;
        % Operational status of CDRA (on/off)
        bActive = true;
        % Time duration of each cycle in seconds
        fCycleTime = 144 * 60; % 144 minutes in seconds
        % Last cycle switch time
        fLastCycleSwitchTime = 0; % [seconds]
    end
    
    methods
        % Constructor (initialization)
        function obj = CDRA()
            disp('CDRA initialized.');
        end
        % Method to switch CDRA on or off
        function setActive(obj, bActive)
            obj.bActive = bActive;
            disp(['CDRA is now ', num2str(bActive)]);
        end
        % Method to switch between adsorption and desorption cycles
        function switchCycle(obj)
            if obj.iCycleActive == 1
                obj.iCycleActive = 2;
            else
                obj.iCycleActive = 1;
            end
            disp(['Cycle switched to: ', num2str(obj.iCycleActive)]);
        end
        
        % Execution method (simple simulation)
        function exec(obj, currentTime)
            if obj.bActive
                % Execute the current cycle
                disp(['Executing Cycle ', num2str(obj.iCycleActive)]);
                % Check if it's time to switch the cycle
                if (currentTime - obj.fLastCycleSwitchTime) >= obj.fCycleTime
                    obj.switchCycle();
                    obj.fLastCycleSwitchTime = currentTime;
                end
            else
                % Message if CDRA is inactive
                disp('CDRA is inactive.');
            end
        end
    end
end
