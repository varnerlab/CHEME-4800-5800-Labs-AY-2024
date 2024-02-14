function hashing_vectorizer_simple(strings::Array{String,1}; 
    size::Int64=10, corpus::Dict{String,Int64} = nothing)::Array{Int64,1}

    # initialize -
    result = Array{Int64,1}(undef, size);
    fill!(result, 0); # initialize with 0s

    for string ∈ strings
        h = corpus[string]; # returns the position of the string in the corpus
        i = mod(h, size); # compute the index
        result[i] += 1; # increment the count
    end

    # return the result -
    return result;
end