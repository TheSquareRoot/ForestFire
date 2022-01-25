
function catchfire(i, j, p, forest)
    countlateral = 0 # Count the buring trees around point i, j
    countdiagonal = 0
    for k in (i-1):(i+1), l in (j-1):(j+1)
        if forest[k, l] == 2
            if k != i && l != j
                countdiagonal += 1
            else
                countlateral += 1
            end
        end
    end
    fire = rand() >= ((1-p)^countlateral)*(1-0.7*p)^countdiagonal 
    return fire
end


function burn(forest, p)
    nx = size(forest, 1)
    ny = size(forest, 2)
    new_forest = fill(0, (nx, ny))

    for i in 1:nx, j in 1:ny
        if forest[i, j] == 3 
            new_forest[i, j] = 3 - catchfire(i, j, p, forest)
        elseif forest[i, j] == 2
            new_forest[i, j] = 1
        else
            new_forest[i, j] = forest[i, j]
        end
    end
    return new_forest
end  

