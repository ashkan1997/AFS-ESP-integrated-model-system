% --------------------
%% Open Simulink model
% --------------------

% Check if the Simulink model is already opened. Otherwise open it
openModels = find_system( 'SearchDepth', 0 );
if ( isempty( find( strcmp( openModels, 'combined' ), 1 ) ) )
    load_system( 'combined.slx' );
    open_system( 'combined' );
end