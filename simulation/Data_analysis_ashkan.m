%% ESP + AFS
r_comb = comb_data.BdyFrm.Cg.AngVel.r.Data;
r_comb = smoothdata(r_comb);
beta_comb = comb_data.BdyFrm.Cg.Ang.Beta.Data;
beta_comb = smoothdata(beta_comb);
comb_x = comb_data.InertFrm.Cg.Disp.X.Data;
comb_y = comb_data.InertFrm.Cg.Disp.Y.Data;

%% ESP

r_ESP = ESP_data.BdyFrm.Cg.AngVel.r.Data;
r_ESP = smoothdata(r_ESP);
beta_ESP = ESP_data.BdyFrm.Cg.Ang.Beta.Data;
beta_ESP = smoothdata(beta_ESP);
ESP_x = ESP_data.InertFrm.Cg.Disp.X.Data;
ESP_y = ESP_data.InertFrm.Cg.Disp.Y.Data;

%% AFS

r_AFS = AFS_data.BdyFrm.Cg.AngVel.r.Data;
r_AFS = smoothdata(r_AFS);
beta_AFS = AFS_data.BdyFrm.Cg.Ang.Beta.Data;
beta_AFS = smoothdata(beta_AFS);
AFS_x = AFS_data.InertFrm.Cg.Disp.X.Data;
AFS_y = AFS_data.InertFrm.Cg.Disp.Y.Data;
%% No controll

r_NC = NC_data.BdyFrm.Cg.AngVel.r.Data;
r_NC = smoothdata(r_NC);
beta_NC = NC_data.BdyFrm.Cg.Ang.Beta.Data;
beta_NC = smoothdata(beta_NC);
NC_x = NC_data.InertFrm.Cg.Disp.X.Data;
NC_y = NC_data.InertFrm.Cg.Disp.Y.Data;

%%
time = model_sim.tout;


%% Yaw rate
figure( 'Name','Yaw rate')

plot(time , r_NC , 'LineWidth', 4 , LineStyle='-.' ,DisplayName='No Controller')
hold on
plot(time , r_AFS , 'LineWidth', 4 , LineStyle='--' ,DisplayName='AFS')
hold on
plot(time , r_comb , 'LineWidth', 6 , 'DisplayName', ' AFS + ESP' , 'LineStyle','-' , 'Color', [0.518 0.635 0.286])
hold on
plot(time , r_ESP , 'LineWidth', 4 , LineStyle=':' ,DisplayName='ESP')
hold on
fontsize(gca,33,"pixels")
legend('FontSize',24)
xlabel('Time', 'FontWeight','bold' , 'FontSize',35)
ylabel('$\Omega$ [rad/s]', 'FontWeight','bold', 'FontSize',35)
grid off
fig = gcf;


% exportgraphics(fig,['figure/' scenario_name '_Omega.eps']);
% annotation("textbox" , 'String', {['k1= ' , num2str(vehicle_data.AFS.k1)] ...
%                                 ['k2= ' , num2str(vehicle_data.AFS.k2)] ...
%                                 ['B1= ' , num2str(vehicle_data.AFS.B1)] ...
%                                 ['B2= ' , num2str(vehicle_data.AFS.B2)] ...
%                                 ['mu =' , num2str(input.mu)] ...
%                                 ['V0 =' ,num2str(input.intvel*3.6)]} , ...
%                                 'FitBoxToText', 'on' , 'FontWeight', 'bold' , ...
%                                 'FontSize',11 , 'Position',[0.72 0.81 0.1 0.1] ...
%                                 , 'HorizontalAlignment','center')

%% side slip angle (beta)

figure('Name','Beta')
plot(time , beta_NC , 'LineWidth', 3 , LineStyle='-.' ,DisplayName='No Controller')
hold on
plot(time , beta_AFS , 'LineWidth', 3 , LineStyle='--' ,DisplayName='AFS')
hold on
plot(time , beta_comb , 'LineWidth', 5 , 'DisplayName', ' AFS + ESP' , 'LineStyle','-' , 'Color',  [0.518 0.635 0.286])
hold on
plot(time , beta_ESP , 'LineWidth', 3 , LineStyle=':' ,DisplayName='ESP')
hold on
fontsize(gca,33,"pixels")
legend('FontSize',24)
xlabel('Time', 'FontWeight','bold' , 'FontSize',35)
ylabel('$\beta$ [rad/s]', 'FontWeight','bold' , 'FontSize',35)
grid off

fig = gcf;
% exportgraphics(fig,['figure/' scenario_name '_beta.eps']);
% annotation("textbox" , 'String', {['k1= ' , num2str(vehicle_data.AFS.k1)] ...
%                                 ['k2= ' , num2str(vehicle_data.AFS.k2)] ...
%                                 ['B1= ' , num2str(vehicle_data.AFS.B1)] ...
%                                 ['B2= ' , num2str(vehicle_data.AFS.B2)] ...
%                                 ['mu =' , num2str(input.mu)] ...
%                                 ['V0 =' ,num2str(input.intvel*3.6)]} , ...
%                                 'FitBoxToText', 'on' , 'FontWeight', 'bold' , ...
%                                 'FontSize',11 , 'Position',[0.72 0.81 0.1 0.1] ...
%                                 , 'HorizontalAlignment','center')


%% Activation Function
rho_c = model_sim.Activation_fun.rho_c.Data;
cond = model_sim.Activation_fun.cond.Data;
cond_test = linspace(0 , max(cond) , length(rho_c));

figure('Name','Activation Function')
plot(cond_test , rho_c , 'DisplayName' , 'Rho_c' , 'LineWidth',2)
hold on
plot(cond_test , 1-rho_c , 'DisplayName' , '1-Rho_c' , 'LineStyle', '--' , 'LineWidth',2)
hold on
fontsize(gca,33,"pixels")
legend('FontSize',24)
grid off
xlabel('$\kappa_{1} \dot{\beta} + \kappa_{2} \beta$' , 'FontWeight','bold' , 'FontSize',35)
ylabel('$\rho_{c}$', 'FontWeight','bold' , 'FontSize',35)
fig = gcf;
% exportgraphics(fig,['figure/' scenario_name '_Activation_Fun.eps']);


%% trajectory
% 
% figure()
% plot(NC_x , NC_y , 'DisplayName', ' No controller')
% hold on
% plot(comb_x , comb_y , 'DisplayName','AFS + ESP')
% hold on
% plot(ESP_x , ESP_y , 'DisplayName','ESP')
% hold on
% plot(AFS_x , AFS_y , 'DisplayName','AFS')
% hold on
% xlabel('X [m]')
% ylabel('Y [m]')
% grid on
% legend
