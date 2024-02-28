abstract type MyAbstractGraphModel end

mutable struct MySimpleUndirectedWeightedGraphModel <: MyAbstractGraphModel
   
   # data -
   vertices::Union{Nothing,Vector{Int}}
   edges::Dictionay{Tuple{Int, Int}}

   # constructor -
   MySimpleUndirectedWeightedGraphModel() = new();

end

mutable struct MySimpleDirectedWeightedGraphModel <: MyAbstractGraphModel
   
   # data -
   vertices::Vector{Int}
   edges::Dictionary{Tuple{Int, Int}, Float64}

   # constructor -
   MySimpleDirectedWeightedGraphModel() = new();
end