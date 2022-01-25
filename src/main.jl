using .ForestFire

using GLMakie

# PARAMETERS
nx = 100;
ny = 100;
density = 0.7;
transmission_prob = 0.8;

# Initialize forest
forest = Observable(createforest(nx, ny, density));
forest[][div(nx, 2), div(ny, 2)] = 2;

# Initialize Makie scene
fig, ax = plotforest(forest, nx, ny)

# Interactive run button
run = Button(fig[2, 1]; label = "run", tellwidth=false)

isrunning = Observable(false)
on(run.clicks) do clicks; isrunning[] = !isrunning[]; end
on(run.clicks) do clicks
    @async while isrunning[]
        isopen(fig.scene) || break
        forest[] = burn(forest[], transmission_prob)
        sleep(0.1)
    end
end

# Start fires where the user clicks
ax1 = content(fig[1, 1])
Makie.deactivate_interaction!(ax1, :rectanglezoom)

spoint = select_point(ax1.scene)

on(spoint) do coord
    x, y = coord
    i = trunc(Int, x)
    j = trunc(Int, y)
    forest[][i, j] = 2
    forest[] = forest[]
end
