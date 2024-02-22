function simulation(world::MyTwoDimensionalGridWorldModel, rule::MyTwoDimensionalGridWorldRuleModel; 
    number_of_iterations::Int64 = 100)::Dict{Int64, Dict{Tuple{Int64,Int64}, Int64}}
    
    # initialize -
    number_of_rows = world.number_of_rows;
    number_of_columns = world.number_of_columns;
    frames = Dict{Int64, Dict{Tuple{Int64,Int64}, Int64}}();
    frames[0] = world.state; # capture the initial state of the world
    decision = rule.decision;
    
    # iterate -
    for i ∈ 1:number_of_iterations
        
        # grab the previous frames -
        current_frame = frames[i-1];
        next_frame = Dict{Tuple{Int64,Int64}, Int64}();
        for row ∈ 1:number_of_rows
            for column ∈ 1:number_of_columns
                next_frame[(row, column)] = 0;
            end
        end

        for row ∈ 2:(number_of_rows-1)
            for column ∈ 2:(number_of_columns-1)
                
                left = current_frame[(row, column-1)];
                right = current_frame[(row, column+1)];
                up = current_frame[(row-1, column)];
                down = current_frame[(row+1, column)];
                me = current_frame[(row, column)];

                # compute the average value -
                average = (left + right + up + down + me) ÷ 5;

                # use the decision rule to update the frame -
                next_frame[(row, column)] = decision[hash(average)];
            end
        end

        # store the frame -
        frames[i] = next_frame;
    end

    # return -
    return frames;
end

function transform(world::MyTwoDimensionalGridWorldModel, frames::Dict{Int64, Dict{Tuple{Int64,Int64}, Int64}})::Nothing
    
    number_of_rows = world.number_of_rows;
    number_of_columns = world.number_of_columns;

    number_of_frames = length(frames);
    for i ∈ 0:(number_of_frames-1)
        frame = frames[i];
        grid = Array{Int64,2}(undef, number_of_rows, number_of_columns);
        for row ∈ 1:number_of_rows
            for column ∈ 1:number_of_columns
                grid[row, column] = frame[(row, column)];
            end
        end
        
        save(File{format"JPEG"}(joinpath(_PATH_TO_IMAGES, "img-$(i).jpeg")), Gray.(1 .- grid));
    end
end