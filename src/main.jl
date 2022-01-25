using .ForestFire

using GLMakie

# PARAMETERS
nx = 100;
ny = 100;
density = 0.5;
steps = 100;

# Initialize forest
forest = Observable(createforest(nx, ny, density));
# Start fire 
forest[][div(nx, 2), div(ny, 2)] = 2;



plotforest(forest)

# Spread fire
for t in 1:steps
    forest[] = step(forest[]);
    sleep(0.1)
end

# plotforest(forest)
