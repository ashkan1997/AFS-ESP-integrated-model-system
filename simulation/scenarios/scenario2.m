
function [scenario_name , input] = scenario2(V0)

    % scenario 2
    % Sine wave with low friction
    scenario_name           = 'Scenario_2';
    input.str.amp           = 1;
    input.str.freq          = 1;
    input.str.sample_time   = 0;
    input.intvel            = V0;
    input.mu                = 0.2;
    input.flag              = 1; % 1-> sine wave , 0 -> step

end