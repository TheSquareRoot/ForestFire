using CairoMakie, StatsBase

function plotforest(forest, nx, ny)
    my_colors = ["#ffffff", "#563524", "#e12719", "#30a144"]

    # Create the graph
    fig = Figure()
    ax = Axis(fig[1, 1])

    heatmap(1:nx, 1:ny, forest, colormap = my_colors, axis = (aspect = 1, xlabel = "x axis", ylabel = "y axis"))

    return fig, ax
end
