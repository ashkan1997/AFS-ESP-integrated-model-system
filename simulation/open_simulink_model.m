% --------------------
%% Open Simulink model
% --------------------

% Check if the Simulink model is already opened. Otherwise open it
openModels = find_system( 'SearchDepth', 0 );
if ( isempty( find( strcmp( openModels, 'ESP_sim' ), 1 ) ) )
    load_system( 'ESP_sim.slx' );
    open_system( 'ESP_sim' );
end