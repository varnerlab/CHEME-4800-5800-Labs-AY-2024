function build(model::Type{MySingleIndexModel}, data::NamedTuple)::MySingleIndexModel

    # build an empty model instance -
    m = model();

    # get data from the NamedTuple -
    m.α = data.α;
    m.β = data.β;
    m.r = data.r;
    m.ϵ = data.ϵ;    

    # return the model -
    return m;
end

"""
    build(type::Type{MySimulatedAnnealingProblem}, data::NamedTuple) -> MySimulatedAnnealingProblem
"""
function build(modeltype::Type{MySimulatedAnnealingProblem}, data::NamedTuple)::MySimulatedAnnealingProblem

    # initialize -
    model = MySimulatedAnnealingProblem();

    # if we have options, add them to the contract model -
    if (isempty(data) == false)
        for key ∈ fieldnames(modeltype)
            
            # convert the field_name_symbol to a string -
            field_name_string = string(key)

            # check the for the key -
            if (haskey(data, key) == false)
                throw(ArgumentError("NamedTuple is missing: $(field_name_string)"))
            end

            # get the value -
            value = data[key]

            # set -
            setproperty!(model, key,  value)
        end
    end

    # return -
    return model;
end