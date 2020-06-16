%==========================================================================
%This function takes the Laplacian matrix of the graph and eplsilon and
%implements the Scaling Algoritthm. At the end returns S, the slack
%variable, the vector y and sum_y which is the objective value of the dual.
%==========================================================================

function [S, y, sum_y, progress] = ScalingAlg( L, epsilon)
   
    it = 0;
    progress = zeros(2, 1);
    
    n = length(L);
    roh = 5*n;% + sqrt(n);
    
    z = trace(L);
    
    [S , y] = GetFirstPairSlackY(L);
    min_y0 = min(y) + 1;
    sum_y = sum(y);    
    
    while( ((z-sum_y)/(abs(sum_y)+1)) >= epsilon )
        
        progress(1,it + 1) = it;
        progress(2,it + 1) = -sum_y;
        it = it + 1;
        
        invS = inv(S);
        diagInvS = diag(invS);
        
        M = GetMatrixM(invS);
        
        delta = z - sum_y;
        
        dz = StepDirection(M, diagInvS, delta, roh);
       
        z_new = sum_y + (delta/roh)*(dot(transpose(diagInvS),dz) + n);

        
        if (z_new < z) && (all(eig(diag(dz)+S) > 0))
            z = z_new;
            delta = z - sum_y;
            dz = StepDirection(M, diagInvS, delta, roh);
        end
        
        normP = GetNormP( diagInvS, dz, delta, roh );    
    
        [ S, y ] = GetPairSlackY( L, y , normP, dz, min_y0 );
        
        sum_y = sum(y);
    end
    sum_y = -sum(y);
end

