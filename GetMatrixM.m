%==========================================================================
%This function takes the inverse of the matrix S, and computes the matrix M 
%of the scaling algorithm.
%==========================================================================

function [ M ] = GetMatrixM( invS )

    n = length(invS);
    M = zeros(n,n);          
    
    for i=1:n
        for j=1:n
    
            temp = invS(i,j);
            M(i,j) = temp^2;
            
        end
    end

end

