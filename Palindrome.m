%==========================================================================
%This function takes, a list of codewords of length n, and appends a copy 
%of the list in backwards at the end of the list.
%==========================================================================

function [ oL ] = Palindrome( iL, n)
   oL = iL;
    for i = 1 : 2^(n-1)
        oL(2^(n-1)+i,:) = iL(2^(n-1)-(i-1),:);
    end

end

