"""
    function simplereadcsvfile(path::String; 
        delim::Char=',', keyindex::Int64 = 1) -> Tuple{Array{String,1}, Dict{Int, Array{Number,1}}}
""" 
function simplereadcsvfile(path::String; 
    delim::Char=',', keyindex::Int64 = 1)::Tuple{Array{String,1}, Dict{Int, Array{Number,1}}}
    
    # check: is the path arg legit?
    # ....

    # initialize
    counter = 1
    header = Array{String,1}()
    data = Dict{Int,Array{Float64,1}}()

    # main -
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            
            # split the line around the delim. Check out: https://docs.julialang.org/en/v1/base/strings/#Base.split
            fields = split(line, delim) .|> String; # what the heck??
            if (counter == 1)
                
                # wow! this is some fancynancy syntax! what the what?!?
                foreach(value -> push!(header, value), fields); # Check out: https://docs.julialang.org/en/v1/base/collections/#Base.foreach
                counter += 1 # update the counter
            else

                # First, initialize some temporary storage -
                tmpstorage = Array{Float64,1}()
                keyfield = fields[keyindex] # get a key field
                for i ∈ eachindex(fields) # iterate over the fields
                    
                    # for all fields NOT equal to the key field, parse the value and push it to the temporary storage
                    if (i != keyindex)
                        push!(tmpstorage, parse(Float64, fields[i]))
                    end
                end

                # do not add bad keys -
                if (isempty(keyfield) == false)
                    data[parse(Int, keyfield)] = tmpstorage;
                end
            end
        end
    end

    # return -
    return (header, data)
end

"""
    betterreadcsvfile(path::String; 
        delim::Char=',', keyindex::Int64 = 1) -> Tuple{Array{String,1}, Dict{Int, MyRuntimeNumericalRecordType}}

"""
function betterreadcsvfile(path::String; 
    delim::Char=',', keyfielddata = 1=>Int64)::Tuple{Array{String,1}, Dict{Int, MyRuntimeNumericalRecordType}}
    
    # TODO is the path arg legit?
    # if not a legit path, throw an error
    # if not a csv file, throw an error

    # initialize
    counter = 1
    header = Array{String,1}()
    data = Dict{Int, MyRuntimeNumericalRecordType}()
    keyfieldindex, keyfieldtype = keyfielddata;

    # main -
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            
            # split the line around the delim. Check out: https://docs.julialang.org/en/v1/base/strings/#Base.split
            fields = split(line, delim) .|> String; # what the heck??
            if (counter == 1)
                
                # wow! this is some fancynancy syntax! what the what?!?
                foreach(value -> push!(header, value), fields); # Check out: https://docs.julialang.org/en/v1/base/collections/#Base.foreach
                counter += 1 # update the counter
            else

                # First, initialize some temporary storage -
                tmpstorage = Array{Float64,1}()
                keyfield = fields[keyfieldindex] # get a key field
                for i ∈ eachindex(fields) # iterate over the fields
                    
                    # for all fields NOT equal to the key field, parse the value and push it to the temporary storage
                    if (i != keyfieldindex)
                        push!(tmpstorage, parse(Float64, fields[i]))
                    end
                end

                # do not add bad keys -
                if (isempty(keyfield) == false)
                    data[parse(keyfieldtype, keyfield)] = build(MyRuntimeNumericalRecordType, parse(Int, keyfield), tmpstorage);
                end
            end
        end
    end

    # return -
    return (header, data)
end


# -- PUBLIC FUBCTIONS ABOVE HERE ------------------------------------------------------------------------------- #