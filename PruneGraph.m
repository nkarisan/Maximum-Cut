%==========================================================================
%This function takes an n by n matrix which is filled with ones. In each
%iteration it randomly deletes one of the ones and checks whether the graph 
%is still connected or not. At last returns a matrix related to a connected
%graph.
%==========================================================================

function[mat] = PruneGraph(mat, n)
    linkCount = ((n - 1) * n) / 2;
    for ind = 1 : linkCount
        row = randi(n);
        col = randi(n);
        if row ~= col
            if mat(row, col) == 1
                cpyMat = mat;
                cpyMat(row, col) = 0;
                cpyMat(col, row) = 0;              
                if IsConnected(cpyMat, n) == 1
                    mat = cpyMat;
                end
            end
        end
    end
end