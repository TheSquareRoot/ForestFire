using StatsBase

function createforest(nx, ny, density)
    # Create random forest
    forest = [sample([0, 3], pweights([1-density, density])) for i in 1:nx, j in 1:ny]
    # Empty edges
    forest[1,:] *= 0
    forest[end,:] *= 0
    forest[:, 1] *= 0
    forest[:,end] *= 0

    return forest
end


