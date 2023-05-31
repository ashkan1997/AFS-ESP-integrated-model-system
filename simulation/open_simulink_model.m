% --------------------
%% Open Simulink model
% --------------------

% Check if the Simulink model is already opened. Otherwise open it
openModels = find_system( 'SearchDepth', 0 );
if ( isempty( find( strcmp( openModels, 'single_track' ), 1 ) ) )
    load_system( 'single_track.slx' );
    open_system( 'single_track' );
end