function build(modeltype::Type{MyTwoDimensionalGridWorldRuleModel}, 
    rule::Dict{Int64,Int64})::MyTwoDimensionalGridWorldRuleModel

    # build an empty object -
    model = MyTwoDimensionalGridWorldRuleModel();
    steps = range(0.0, step = 0.2, stop = 1.0) |> collect;

    # set the rule -
    ruledict = Dict{UInt64,Int64}();
    for (k,v) ∈ rule
        step = steps[k];
        ruledict[hash(step)] = v;
    end
    model.decision = ruledict;

    # return the model -
    return model;
end

function build(modeltype::Type{MyTwoDimensionalGridWorldModel}, 
    number_of_rows::Int64, number_of_columns::Int64, 
    state::Dict{Tuple{Int64,Int64},Int64})::MyTwoDimensionalGridWorldModel

    # build an empty object -
    model = MyTwoDimensionalGridWorldModel();
    model.number_of_rows = number_of_rows;
    model.number_of_columns = number_of_columns;
    model.state = state;

    # return the model -
    return model;
end