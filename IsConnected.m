%==========================================================================
%This function takes an n by n matrix and using transitive closure checks
%whether its corresponding graph is connected or not!
%==========================================================================

function [ res ] = IsConnected( mat, n )
    m = mat;
    for k = 1 : n
        for i = 1 : n
            for j = 1 : n
                m(i,j) = m(i,j) | (m(i,k) & m(k,j));
            end
        end
    end
    if sum(sum(m)) == n^2
        res = 1;
    else
        res = 0;
    end
end

