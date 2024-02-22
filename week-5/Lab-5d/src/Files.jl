# -- PRIVATE FUNCTIONS BELOW HERE ----------------------------------------------------------------------------------------------- #
function _extractframe(world::MyTwoDimensionalGridWorldModel, frames::Dict{Int64, Dict{Tuple{Int64,Int64}, Int64}}; 
    index::Int64 = 0)::Array{Int64,2}
    
    number_of_rows = world.number_of_rows;
    number_of_columns = world.number_of_columns;
    grid = Array{Int64,2}(undef, number_of_rows, number_of_columns);
    
    frame = frames[index];
    for row ∈ 1:number_of_rows
        for column ∈ 1:number_of_columns
            grid[row, column] = frame[(row, column)];
        end
    end
    return grid;
end
# -- PRIVATE FUNCTIONS ABOVE HERE ---------------------------------------------------------------------------------------------- #

# -- PUBLIC FUNCTIONS BELOW HERE ----------------------------------------------------------------------------------------------- #
"""
    exportframes(world::MyTwoDimensionalGridWorldModel, frames::Dict{Int64, Dict{Tuple{Int64,Int64}, Int64}};
        exportonlyeven::Bool = true) -> Nothing
"""
function exportframes(world::MyTwoDimensionalGridWorldModel, frames::Dict{Int64, Dict{Tuple{Int64,Int64}, Int64}};
    exportonlyeven::Bool = true, shoulddelete::Bool = true)::Nothing
    
    if (shoulddelete == true)
        foreach(rm, filter(endswith(".jpeg"), readdir(_PATH_TO_IMAGES, join=true))); # wow, this is a beautiful line of code!!
    end

    number_of_frames = length(frames);
    for i ∈ ProgressBar(0:(number_of_frames-1))
        grid = _extractframe(world, frames, index=i);    
        if (iseven(i) == true && exportonlyeven == true)
            save(File{format"JPEG"}(joinpath(_PATH_TO_IMAGES, "img-$(i).jpeg")), Gray.(1 .- grid));
        else
            save(File{format"JPEG"}(joinpath(_PATH_TO_IMAGES, "img-$(i).jpeg")), Gray.(1 .- grid));
        end
    end
end
# -- PUBLIC FUNCTIONS ABOVE HERE ----------------------------------------------------------------------------------------------- #