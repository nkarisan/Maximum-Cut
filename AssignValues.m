%==========================================================================
%This function takes an n by n matrix and using the given interval assigns 
%a weight to each edge!
%==========================================================================

function[mat] = AssignValues(mat, n,  minValue, maxValue)
    for rInd = 1 : n
        mat(rInd, rInd) = 0;
        for cInd = rInd + 1 : n
            if mat(rInd, cInd) == 1
                rnd = (rand(1) * maxValue) + 1;
                mat(rInd, cInd) = rnd;
                mat(cInd, rInd) = rnd;
            end
        end
    end
end