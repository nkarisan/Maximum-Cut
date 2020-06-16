function [ index , eleVal ] = DiffIndex( first, second, n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    eleVal =0;
 
    for i = 1 : n
        if first(i) ~= second(i)
            eleVal = second(i);
            break
        end
    end
    index = i;
end

