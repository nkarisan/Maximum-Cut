%==========================================================================
%This function takes, n, the length of each codeword and returns its 
%correspoinding gray code. Gray code is used to generate all the 
%possible two-way partitioning.
%==========================================================================

function [ list ] = GrayCode( n )
    list = [2 ;1 ];
    
    for i=2 : n
        list = Palindrome(list, i);
        for j=1 : 2^(i-1)
            list(j,i) = 2;
            list(j+2^(i-1),i) = 1;
        end
    end

end

