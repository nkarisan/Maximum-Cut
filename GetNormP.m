%==========================================================================
%This function computes norm of the function P based on the gradient of the 
%Dual Potential Function used in the scaling algorithm.
%==========================================================================

function [ normP ] = GetNormP( diagInvS, dz, delta, roh )
  
    n = length(diagInvS);
    
    potFunc = - (roh/delta)* ones(n, 1) + diagInvS;
    
    normP = sqrt(-dot(potFunc',dz));


end

