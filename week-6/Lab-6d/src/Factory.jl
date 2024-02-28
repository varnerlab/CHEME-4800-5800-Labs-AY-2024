
"""
    function build(model::Type{T}; 
        verticies::Vector{Int64} = nothing, 
        edges::Dictionary{Tuple{Int, Int}, Float64} = nothing) where T <: MyAbstractGraphModel
"""
function build(model::Type{T}; 
    verticies::Vector{Int64} = nothing, 
    edges::Dictionary{Tuple{Int, Int}, Float64} = nothing) where T <: MyAbstractGraphModel

    # build -
    modelinstance = model();
    modelinstance.vertices = verticies;
    modelinstance.edges = edges;

    # return -
    return modelinstance;
end