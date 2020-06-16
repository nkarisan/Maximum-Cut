%==========================================================================
%This function in each iteration computes the new feasible point in the 
%scaling algorithm.
%==========================================================================

function [ S, y ] = GetPairSlackY( M, y_k , normP, direcVec, min_y0 )

    S = 0;
    alpha = 0.99;
    
    beta = alpha / normP;
             
    y = y_k + beta * direcVec';
        
    if ( min(y) < min_y0 )
       S = M - diag(y);          
    else
       display('infeasible Beta!!!!!'); 
    end
     

end

