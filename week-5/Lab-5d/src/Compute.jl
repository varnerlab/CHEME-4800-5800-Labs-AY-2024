function simulation(world::MyTwoDimensionalGridWorldModel, rule::MyTwoDimensionalGridWorldRuleModel; 
    number_of_iterations::Int64 = 100)::Dict{Int64, Array{Int64,2}}
    
    # initialize -
    number_of_rows = world.number_of_rows;
    number_of_columns = world.number_of_columns;
    frames = Dict{Int64, Array{Int64,2}}();
    frames[0] = world.state; # capture the initial state of the world

    # iterate -
    for i ∈ 1:number_of_iterations
        
        # grab the previous frames -
        current_frame = frames[i-1];

        for row ∈ 2:number_of_rows
            for column ∈ 2:number_of_columns
                
                

            end
        end
    end

    # return -
    return frames;
end