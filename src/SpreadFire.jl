
function nearfire(i, j, forest)
    for k in (i-1):(i+1), l in (j-1):(j+1)
        if forest[k, l] == 2
            return true
        end
    end
    return false
end

function step(forest)
    nx = size(forest, 1)
    ny = size(forest, 2)
    new_forest = fill(0, (nx, ny))

    for i in 1:nx, j in 1:ny
        if forest[i, j] == 3 
            new_forest[i, j] = 3 - nearfire(i, j, forest)
        elseif forest[i, j] == 2
            new_forest[i, j] = 1
        else
            new_forest[i, j] = forest[i, j]
        end
    end
    return new_forest
end  


