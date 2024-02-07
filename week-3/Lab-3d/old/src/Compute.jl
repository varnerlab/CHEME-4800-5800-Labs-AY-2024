
"""
    findrecord(records::Dict{Int64, MyTreasuryDataRecordType}, CUSIP::String) -> Union{MyTreasuryDataRecordType, Nothing}
"""
function findrecord(records::Dict{Int64, MyTreasuryDataRecordType}, CUSIP::String)::Union{MyTreasuryDataRecordType, Nothing}
    
    # initialize -
    record = nothing;
    
    # loop through the records, and find the record with the CUSIP matching the input CUSIP
    for (k, v) in records
        if (v.CUSIP == CUSIP)
            return v
        end
    end

    # return the record -
    return record
end