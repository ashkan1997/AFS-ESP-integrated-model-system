function AFS_data = AFS_data()
    
    X       = 0;  % controller gain
    lambda  = 1;  % positive constant
    ro      = 0.5;
    mu      = 0.9;

    AFS_data.X          = X;
    AFS_data.lambda     = lambda;
    AFS_data.ro         = ro;
    AFS_data.mu         = mu;
end