"""
"""
function build(model::Type{MyMoviewReviewRecordModel}, line::String; delim::String=" ")::MyMoviewReviewRecordModel
    
    # initialize -
    order = Dict{String, Int}();
    counter = 1; # initialize a counter
    record = MyMoviewReviewRecordModel(); # build an empty model
    
    
    puncuation_skip_set = Set{String}();
    push!(puncuation_skip_set, ",");
    push!(puncuation_skip_set, ".");
    push!(puncuation_skip_set, "!");
    push!(puncuation_skip_set, "?");
    push!(puncuation_skip_set, ";");
    push!(puncuation_skip_set, ":");
    push!(puncuation_skip_set, ")");
    push!(puncuation_skip_set, "(");
    push!(puncuation_skip_set, "\"");
    push!(puncuation_skip_set, "/");
    push!(puncuation_skip_set, "\\");
    push!(puncuation_skip_set, "-");
    push!(puncuation_skip_set, "_");
    
    # split the line around the delim. Check out: https://docs.julialang.org/en/v1/base/strings/#Base.split
    fields = split(line, delim) .|> String; # make strings out of the fields
    for field ∈ fields # iterate over the fields
        
        if ((field ∈ puncuation_skip_set) == false) # if the field is not in the puncuation skip set
            order[field] = counter; # add the field to the order
            counter += 1; # update the counter
        end
    end
    
    # set the data on the model -
    record.order = order;
    
    # return -
    return record;
end