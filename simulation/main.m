%% Main script for  with a single track vehcile model
%  authors:
%  Ashkan Behmanesh

initialize_environment;

%% Open Simulink model
open_simulink_model;

%% Load vehicle data
%------------------------------------------------------------------------------

% test_tyre_model; % some plot to visualize the curvers resulting from the
                   % loaded data

vehicle_data = getVehicleDataStruct();
% pacejkaParam = loadPacejkaParam();
L            = vehicle_data.vehicle.L;
tau_delta    = vehicle_data.steering_system.tau_D;
R0           = vehicle_data.tyre_data_f.R0;

%% controller parameter

% here is some simplified parameters :)
m = vehicle_data.vehicle.m;
a = vehicle_data.vehicle.Lf;
b = vehicle_data.vehicle.Lr;
izz = vehicle_data.vehicle.i_zz;
g = vehicle_data.vehicle.g;
L = vehicle_data.vehicle.L;
mu = ;  % --> should come from scenario
Car = ;
Caf = ;
