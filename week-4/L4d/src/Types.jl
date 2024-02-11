abstract type AbstractTextRecordModel end

mutable struct MyMoviewReviewRecordModel <: AbstractTextRecordModel
    
    # data -
    order::Dict{String, Int}
    
    # constructor -
    MyMoviewReviewRecordModel() = new(); # empty
end