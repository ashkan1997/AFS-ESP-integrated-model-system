
function [scenario_name , input ]= scenario3(V0)
    % scenario 3
    % Step wave with high friction
    scenario_name           = 'Scenario_3';
    input.str.amp           = 1;
    input.str.freq          = 1;
    input.str.sample_time   = 0;
    input.intvel            = V0;
    input.mu                = 0.9;
    input.flag              = 0; % 1-> sine wave , 0 -> step

end