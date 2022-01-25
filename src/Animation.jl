using GLMakie, StatsBase

function plotforest(forest)
    my_colors = ["#ffffff", "#563524", "#e12719", "#30a144"]

    # Create the graph
    fig = Figure()
    ax = Axis(fig[1, 1])

    heatmap(0:100, 0:100, forest, colormap = my_colors, axis = (aspect = 1, xlabel = "x axis", ylabel = "y axis"))
end
