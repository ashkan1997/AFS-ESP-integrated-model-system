function AFS_param = AFS_param()
    
    X       = 0;  % controller gain
    lambda  = 50;  % positive constant
    ro      = 1;
    mu      = 0.9;
    k1      = 100;
    k2      = 50;
    B1      = 34;
    B2      = 70;

    AFS_param.X          = X;
    AFS_param.lambda     = lambda;
    AFS_param.ro         = ro;
    AFS_param.mu         = mu;
    AFS_param.k1         = k1;
    AFS_param.k2         = k2;
    AFS_param.B1         = B1;
    AFS_param.B2         = B2;
end