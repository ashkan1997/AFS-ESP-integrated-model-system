beta_dot = model_sim.beta_dot.Data;
beta_dot_max = max(abs(beta_dot));

beta = model_sim.ESP.BdyFrm.Cg.Ang.Beta.Data;
beta_max = max(abs(beta));

k1 = vehicle_data.AFS.k1;
k2 = vehicle_data.AFS.k2;
act_range = k1*beta_dot_max + k2*beta_max;

vehicle_data.AFS.B1 = 0.213*act_range;
vehicle_data.AFS.B2 = 0.56*act_range;
% 
% vehicle_data.AFS.B1 = 0.33*act_range;
% vehicle_data.AFS.B2 = 0.66*act_range;