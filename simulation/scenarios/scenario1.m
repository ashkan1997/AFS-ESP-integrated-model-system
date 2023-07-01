
function [ scenario_name , input] = scenario1(V0)

    % scenario 1
    % Sine wave with High friction
    scenario_name           = 'Scenario_1';
    input.str.amp           = 1;
    input.str.freq          = 1;
    input.str.sample_time   = 0;
    input.intvel            = V0;
    input.mu                = 0.9;
    input.flag              = 1; % 1-> sine wave , 0 -> step

end