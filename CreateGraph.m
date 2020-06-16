%==========================================================================
%This function takes, n, the size of the graph and the interval
%in which the weights of the edges should be chosen, then returns a 
%random weighted graph which is connected.
%==========================================================================

function[mat] = CreateGraph(n, minValue, maxValue)
    mat = ones(n, n);
    mat = PruneGraph(mat, n);
    if (maxValue > 0)
      mat = AssignValues(mat, n, minValue, maxValue);       
    end
end