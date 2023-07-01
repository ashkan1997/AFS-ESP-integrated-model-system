
function [scenario_name , input] = scenario4(V0)
    % scenario 4
    % Step wave with low friction
    scenario_name           = 'Scenario_4'
    input.str.amp           = 1;
    input.str.freq          = 1;
    input.str.sample_time   = 0;
    input.intvel            = V0;
    input.mu                = 0.2;
    input.flag              = 0; % 1-> sine wave , 0 -> step

end