# create a field types dictionary -
include("Include.jl")

# 1 CUSIP,
# 2 SecurityType,
# 3 SecurityTerm,
# 4 AuctionDate,
# 5 IssueDate,
# 6 MaturityDate,
# 7 Price,
# 8 HighInvestmentRate,
# 9 HighPrice,
# 10 HighYield,
# 11 InterestRate,
# 12 LowInvestmentRate,
# 13 LowPrice,
# 14 Series,
# 15 Spread,
# 16 Strippable
fields = Dict{Int, Pair{String,Type}}()
fields[1] = "CUSIP" => String;
fields[2] = "SecurityType" => String;
fields[3] = "SecurityTerm" => String;
fields[4] = "AuctionDate" => Date;
fields[5] = "IssueDate" => Date;
fields[6] = "MaturityDate" => Date;
fields[7] = "Price" => Float64;
fields[8] = "HighInvestmentRate" => Float64;
fields[9] = "HighPrice" => Float64;
fields[10] = "HighYield" => Float64;
fields[11] = "InterestRate" => Float64;
fields[12] = "LowInvestmentRate" => Float64;
fields[13] = "LowPrice" => Float64;
fields[14] = "Series" => String;
fields[15] = "Spread" => Float64;
fields[16] = "Strippable" => String;

# parse the file -
records = parsefile(joinpath(_PATH_TO_DATA, "Securities.csv"), fields, delim=',', header=true, verbose=false)