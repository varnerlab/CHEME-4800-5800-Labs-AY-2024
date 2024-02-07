abstract type MyAbstractRecordType end # what is this?

# make a new type mutable called MyTreasuryDataRecordType that is a subtype of MyAbstractRecordType
mutable struct MyTreasuryDataRecordType <: MyAbstractRecordType

    # data -
    CUSIP::Union{String,Nothing};
    SecurityType::Union{String,Nothing};
    SecurityTerm::Union{String,Nothing};
    AuctionDate::Union{Date,Nothing};
    IssueDate::Union{Date,Nothing};
    MaturityDate::Union{Date,Nothing};
    Price::Union{Float64,Nothing};
    HighInvestmentRate::Union{Float64,Nothing};
    HighPrice::Union{Float64,Nothing};
    HighYield::Union{Float64,Nothing};
    InterestRate::Union{Float64,Nothing};
    LowInvestmentRate::Union{Float64,Nothing};
    LowPrice::Union{Float64,Nothing};
    Series::Union{String,Nothing};
    Spread::Union{Float64,Nothing};
    Strippable::Union{String,Nothing};

    # constructor -
    MyTreasuryDataRecordType() = new() # what is this?
end