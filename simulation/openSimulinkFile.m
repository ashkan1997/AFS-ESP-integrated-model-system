function openSimulinkFile(filename)
    % Check if the model is already open
    % mdl = bdroot(filename);
    % if isempty(mdl)
    %     % Model is not open, so open it
    %     open_system(filename);
    %     disp(['Opened Simulink file: ', filename]);
    % else
    %     % Model is already open
    %     disp(['Simulink file "', filename, '" is already open.']);
    % end
    openModels = find_system( 'SearchDepth', 0 );
    if ( isempty( find( strcmp( openModels, filename ), 1 ) ) )
    load_system( 'ESP_sim.slx' );
    open_system( 'ESP_sim' );
    end
end
