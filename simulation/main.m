%% Main script for  with a single track vehcile model
%  authors:
%  Ashkan Behmanesh

initialize_environment;

%% Open Simulink model
% open_simulink_model;


%% Input data
input.str.amp           = 1;
input.str.freq          = 1;
input.str.sample_time   = 0;
input.intvel            = 7;
input.mu                = 0.9;

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
vehicle_data.AFS = AFS_data();
%% controller parameter
m = vehicle_data.vehicle.m;
a = vehicle_data.vehicle.Lf;
b = vehicle_data.vehicle.Lr;
izz = vehicle_data.vehicle.i_zz;
g = vehicle_data.vehicle.g;

Caf = vehicle_data.front_suspension.Ks_f ;
Car = vehicle_data.rear_suspension.Ks_r;

%%
model_name_no_controll = ['no_cntroller_sim'];
model_no_controll = sim(model_name_no_controll);
%%
model_name_AFS = ['AFS_sim'];
% openSimulinkFile([model_name_AFS , '.slx'])
model_AFS = sim( model_name_AFS );

%%
model_name_ESP = ['ESP_sim'];
model_ESP = sim(model_name_ESP);
%%

yaw_rate_AFS = model_AFS.AFS_sim.BdyFrm.Cg.AngVel.r.Data;
yaw_rate_ESP = model_ESP.ESP.BdyFrm.Cg.AngVel.r.Data;
yaw_rate_no_controll = model_no_controll.no_controller.BdyFrm.Cg.AngVel.r.Data;

length(yaw_rate_AFS)
length(yaw_rate_ESP)
length(yaw_rate_no_controll)


%%

time = linspace(0,30);
figure('Name','Yaw_rate')
plot(yaw_rate_no_controll , 'DisplayName', 'No controller' , 'LineWidth', 1 ,'LineStyle','--')
hold on
plot(yaw_rate_ESP , 'DisplayName', 'ESP' , 'LineStyle','-.' , 'LineWidth', 1)
hold on
plot(yaw_rate_AFS , 'DisplayName', ' AFS' , 'LineStyle',':' , 'LineWidth', 1)
hold on
legend
ylabel('Yaw rate [rad/s]')


