%==========================================================================
%This function computes the direction of the steps used in the scaling 
%algorithm.
%==========================================================================

function [ dz ] = StepDirection(M, diagInvS, delta , roh)

    n = length(M);
    invM = inv(M);
    
    dy1 = mtimes(invM, ones(n,1));
    dy2 = mtimes(invM, diagInvS);
   
    dz = (roh/delta)*dy1 - dy2; 
    
end

