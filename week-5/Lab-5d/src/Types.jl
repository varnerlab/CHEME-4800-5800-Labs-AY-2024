abstract type AbstractGridWorldRuleModel end
abstract type AbstractGridWorldModel end

mutable struct MyTwoDimensionalGridWorldRuleModel <: AbstractGridWorldRuleModel
    
    # data -
    decision::Dict{UInt64, Int64};

    # constructor
    MyTwoDimensionalGridWorldRuleModel() = new()
end

mutable struct MyTwoDimensionalGridWorldModel <: AbstractGridWorldModel
    
    # data -
    number_of_rows::Int64
    number_of_columns::Int64
    state::Dict{Tuple{Int64,Int64},Int64};

    # constructor
    MyTwoDimensionalGridWorldModel() = new()
end