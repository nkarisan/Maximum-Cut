%==========================================================================
%This function takes an n by n matrix, and computes the feasible start 
%point 
%==========================================================================

function [ S, y ] = GetFirstPairSlackY( M )
    dim = length(M);
    
    eigenValues = eig(M);

    minEigen = min(eigenValues);
    
    y = (minEigen - 1) * ones(1,dim); % first feasible point
    
    S = M - diag(y);  % Slack matrix S is PD
    
end