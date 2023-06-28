function AFS_data = AFS_data()
    
    X       = 0;  % controller gain
    lambda  =0.7;  % positive constant
    ro      = 1;
    mu      = 0.9;
    k1      = 0.6;
    k2      = 0.98;
    B1      = 0.5;
    B2      = 0.9;

    AFS_data.X          = X;
    AFS_data.lambda     = lambda;
    AFS_data.ro         = ro;
    AFS_data.mu         = mu;
    AFS_data.k1         = k1;
    AFS_data.k2         = k2;
    AFS_data.B1         = B1;
    AFS_data.B2         = B2;
end