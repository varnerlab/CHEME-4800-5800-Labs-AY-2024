
"""
    function build(model::Type{T}, data::Dict{String, Any}) where T <: MyAbstractGraphModel
"""
function build(model::Type{T}, data::Dict{String, Any}) where T <: MyAbstractGraphModel

    # build -
    graphmodel = model();
 
    # build the nodes -
    # ...

    # build the edges -
    # ...

    # return -
    return graphmodel;
end