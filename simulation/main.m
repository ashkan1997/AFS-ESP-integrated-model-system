%% Main script for  with a single track vehcile model
%  authors:
%  Ashkan Behmanesh

initialize_environment;

%% Open Simulink model
open_simulink_model;


%% Input data

V0 = 27.7;               % Initial velocity for HIGH friction    [m/s]
% V0 = 14.6;               % Initial velocity for LOW friction     [m/s]


% [scenario_name , input] = scenario1(V0);        % Sine wave with High friction
% [scenario_name , input] = scenario2(V0);        % Sine wave with low friction
[scenario_name , input] = scenario3(V0);        % Step wave with High friction
% [scenario_name , input] = scenario4(V0);        % Step wave with low friction
    
Tf = 30;

%% Load vehicle data
%------------------------------------------------------------------------------


% test_tyre_model; % some plot to visualize the curvers resulting from the
                   % loaded data

vehicle_data = getVehicleDataStruct();
% pacejkaParam = loadPacejkaParam();
L            = vehicle_data.vehicle.L;
tau_delta    = vehicle_data.steering_system.tau_D;
R0           = vehicle_data.tyre_data_f.R0;
%%
bus_fun;
%%
% AFS = AFS_data();
vehicle_data.AFS = AFS_param();
%% controller parameter
m = vehicle_data.vehicle.m;
a = vehicle_data.vehicle.Lf;
b = vehicle_data.vehicle.Lr;
izz = vehicle_data.vehicle.i_zz;
g = vehicle_data.vehicle.g;

Caf = vehicle_data.front_suspension.Ks_f ;
Car = vehicle_data.rear_suspension.Ks_r;


%% Simulation

% No Controller
AFS_flag = 0; 
ESP_flag = 0;
model_sim = sim("ESP_sim.slx");
NC_data = model_sim.ESP;
% beta_dot = model_sim.beta_dot.Data;
% beta = model_sim.ESP.BdyFrm.Cg.Ang.Beta.Data;
modif_AFS;

% ESP + AFS
AFS_flag = 1; 
ESP_flag = 1;
model_sim = sim("ESP_sim.slx");
comb_data = model_sim.ESP;

% ESP
AFS_flag = 0; 
ESP_flag = 1;
model_sim = sim("ESP_sim.slx");
ESP_data = model_sim.ESP;

% AFS
AFS_flag = 1; 
ESP_flag = 0;
model_sim = sim("ESP_sim.slx");
AFS_data = model_sim.ESP;

clc
fprintf('Simulation complete.\n');


%% Data Analysis
Data_analysis_ashkan;


