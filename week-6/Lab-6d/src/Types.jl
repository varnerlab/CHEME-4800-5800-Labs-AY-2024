abstract type MyAbstractGraphModel end
abstract type MyAbstractGraphNodeModel end

mutable struct MyGraphNodeModel <: MyAbstractGraphNodeModel
   
   # data -
   data::Float64

   # constructor -
   MyGraphNodeModel() = new();
end

mutable struct MySimpleDirectedGraphModel <: MyAbstractGraphModel
   
   # data -
   nodes::Union{Nothing, Dictionary{Int64, MyGraphNodeModel}}
   edges::Union{Nothing, Dictionay{Tuple{Int, Int}, Float64}}

   # constructor -
   MySimpleDirectedGraphModel() = new();
end

mutable struct MySimpleUndirectedGraphModel <: MyAbstractGraphModel
   
    # data -
    nodes::Union{Nothing, Dictionary{Int64, MyGraphNodeModel}}
    edges::Union{Nothing, Dictionay{Tuple{Int, Int}, Float64}}
 
    # constructor -
    MySimpleUndirectedGraphModel() = new();
 end