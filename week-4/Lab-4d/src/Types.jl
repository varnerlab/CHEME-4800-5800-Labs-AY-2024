abstract type AbstractTextRecordModel end
abstract type AbstractTextDocumentModel end
abstract type AbstractTextDocumentCorpusModel end

mutable struct MyMoviewReviewRecordModel <: AbstractTextRecordModel
    
    # data -
    fields::Array{String,1}
    tokenset::Set{String}
    tokens::Dict{String,Int64}
    inverse::Dict{Int64,String}
    
    # constructor -
    MyMoviewReviewRecordModel() = new(); # empty
end

mutable struct MyMoviewReviewDocumentModel <: AbstractTextDocumentModel
    
    # data -
    records::Dict{Int, MyMoviewReviewRecordModel}
    tokenset::Set{String}
    tokens::Dict{String,Int64}
    
    # constructor -
    MyMoviewReviewDocumentModel() = new(); # empty
end

mutable struct MyMoviewReviewDocumentCorpusModel <: AbstractTextDocumentModel
    
    # data -
    records::Dict{Int, MyMoviewReviewDocumentModel}
    tokens::Dict{String,Int64}
    
    # constructor -
    MyMoviewReviewDocumentCorpusModel() = new(); # empty
end
