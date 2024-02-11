function readfile(path::String; delim=" ")::Dict{Int, MyMoviewReviewRecordModel}
    # check: is the path arg legit? - if not throw an error 

    # initialize
    records = Dict{Int, MyMoviewReviewRecordModel}()
    linecounter = 1; # initialize a counter
    
    # main -
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
        
            # build the record -
            records[linecounter] = build(MyMoviewReviewRecordModel, line, delim=delim);

            # update the counter -
            linecounter += 1; # update the counter
        end
    end

    # return -
    return records
end