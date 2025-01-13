classdef CDRA
    properties
        % 吸着・脱着サイクルの状態（1または2）
        % Adsorption/desorption cycle state (1 or 2)
        iCycleActive = 1;
        
        % CDRAの動作状態（オン/オフ）
        % Operational status of CDRA (on/off)
        bActive = true;
        
        % サイクル時間（秒）
        % Time duration of each cycle in seconds
        fCycleTime = 144 * 60; % 144 minutes in seconds
        
        % 最後のサイクル切り替え時刻
        % Last cycle switch time
        fLastCycleSwitchTime = 0; % [seconds]
    end
    
    methods
        % コンストラクタ（初期化）
        % Constructor (initialization)
        function obj = CDRA()
            disp('CDRA initialized.');
        end
        
        % CDRAをオン/オフに切り替えるメソッド
        % Method to switch CDRA on or off
        function setActive(obj, bActive)
            obj.bActive = bActive;
            disp(['CDRA is now ', num2str(bActive)]);
        end
        
        % サイクルを切り替えるメソッド
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
                % 現在のサイクルの実行
                % Execute the current cycle
                disp(['Executing Cycle ', num2str(obj.iCycleActive)]);
                
                % Check if it's time to switch the cycle
                if (currentTime - obj.fLastCycleSwitchTime) >= obj.fCycleTime
                    obj.switchCycle();
                    obj.fLastCycleSwitchTime = currentTime; % サイクル切り替え時刻を更新
                end
            else
                % CDRAが無効の場合のメッセージ
                % Message if CDRA is inactive
                disp('CDRA is inactive.');
            end
        end
    end
end
