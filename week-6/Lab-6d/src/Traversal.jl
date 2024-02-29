"""
    DFS(graph::T, node::MyGraphNodeModel, visited::Set{Int64}) where T <: MyAbstractGraphModel
"""
function DFS(graph::T, node::MyGraphNodeModel, visited::Set{Int64}) where T <: MyAbstractGraphModel
end

"""
    BFS(graph::T, node::MyGraphNodeModel) where T <: MyAbstractGraphModel
"""
function BFS(graph::T, node::MyGraphNodeModel) where T <: MyAbstractGraphModel

    # initialize -
    visited = Set{Int64}();
    q = Queue{Int64}();
    
end