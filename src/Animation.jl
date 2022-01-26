using GLMakie, StatsBase

function plotforest(forest, nx, ny)
    my_colors = ["#ffffff", "#563524", "#e12719", "#30a144"]

    # Create the graph
    heatmap(1:nx, 1:ny, forest, colormap = my_colors, axis = (aspect = 1, xlabel = "x axis", ylabel = "y axis"))
end
