%==========================================================================
%This function takes an n by n matrix related to a graph, then by an 
%exhaustive search over all the possible cuts, finds the weight of the   
%maximum cut and its corresponding vertex decomposition. 
%==========================================================================

function [ maxCut, maxList ] = BruteForceMaxCut( M )
    n = length(M);
    
    vrtPartin = GrayCode(n);
    
    maxCut = 0;
    maxList = 0;
    prtnL = 2 * ones(1,n);
    cutWeight = 0;
    
    for i = 2 : 2^(n-1)
        [rowIn, newPrtn] = DiffIndex( vrtPartin(i-1,:), vrtPartin(i,:), n);
        prtnL(rowIn) = newPrtn;
        for colIn=1 : n
            if M(rowIn, colIn) ~= 0
                if prtnL(colIn) ~= newPrtn
                    cutWeight = cutWeight + M(rowIn, colIn);
                else
                    cutWeight = cutWeight - M(rowIn, colIn);
                end
            end
        end
        if cutWeight > maxCut
            maxCut = cutWeight;
            maxList = prtnL;
        end
    end
    
    
end

