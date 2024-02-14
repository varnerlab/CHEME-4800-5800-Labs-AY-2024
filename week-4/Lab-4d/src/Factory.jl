"""
"""
function build(model::Type{MyMoviewReviewRecordModel}, line::String; delim::String=" ")::MyMoviewReviewRecordModel
    
    # initialize -
    tokenset = Set{String}(); # build an empty set
    cleaned_fields_data = Array{String,1}(); # build an empty array
    record = MyMoviewReviewRecordModel(); # build an empty model
    
    # do NOT include puncuation in the tokens -
    puncuation_skip_set = Set{String}();
    push!(puncuation_skip_set, ",");
    push!(puncuation_skip_set, ".");
    push!(puncuation_skip_set, "!");
    push!(puncuation_skip_set, "?");
    push!(puncuation_skip_set, ";");
    push!(puncuation_skip_set, ":");
    push!(puncuation_skip_set, ")");
    push!(puncuation_skip_set, "(");
    push!(puncuation_skip_set, "\"");
    push!(puncuation_skip_set, "/");
    push!(puncuation_skip_set, "\\");
    push!(puncuation_skip_set, "-");
    push!(puncuation_skip_set, "_");
    
    # split the line around the delim. Check out: https://docs.julialang.org/en/v1/base/strings/#Base.split
    fields = split(line, delim) .|> String; # make strings out of the fields
    for field ∈ fields # iterate over the fields
        
        if ((field ∈ puncuation_skip_set) == false && (field != "")) # if the field is not in the puncuation set, and is not empty
            push!(tokenset, field); # add the field to the tokens
            push!(cleaned_fields_data, field); # add the field to the cleaned fields data
        end
    end
    record.fields = cleaned_fields_data; # set the data on the model
    
    # build an ordering for the tokens -
    token_array = collect(tokenset) |> sort; # convert the set to an array, and sort it
    tokens = Dict{String,Int64}();
    for i ∈ eachindex(token_array) # iterate over the tokens
        token = token_array[i]; # get the token
        tokens[token] = i; # add the token to the dictionary
    end

    # compute the inverse tokens -
    inverse = Dict{Int64,String}();
    for (k,v) ∈ tokens # iterate over the tokens
        inverse[v] = k; # add the token to the dictionary
    end

    # set the data on the model -
    record.tokenset = tokenset;
    record.tokens = tokens;
    record.inverse = inverse;
    
    # return -
    return record;
end

function build(model::Type{MyMoviewReviewDocumentModel}, 
    records::Dict{Int64, MyMoviewReviewRecordModel})::MyMoviewReviewDocumentModel
    
    # initialize -
    document = MyMoviewReviewDocumentModel(); # build an empty document model
    tokenset = Set{String}(); # build an empty set
    tokens = Dict{String, Int64}();
    inverse = Dict{Int64,String}();

    # first, set the records field on the document -
    document.records = records;

    # process each record, and build the overall list of tokens for this document -
    for (_, record) ∈ records # iterate over the tokens in the records
        record_token_set = record.tokenset;
        for token ∈ record_token_set # iterate over the tokens in the record
            push!(tokenset, token); # add the token to the tokenset
        end
    end
    document.tokenset = tokenset; # set the data on the document

    # build an ordering for the tokens -
    token_array = collect(tokenset) |> sort; # convert the set to an array, and sort it
    for i ∈ eachindex(token_array) # iterate over the tokens
        token = token_array[i]; # get the token
        tokens[token] = i; # add the token to the dictionary
    end
    document.tokens = tokens; # set the data on the document

    # inverse -
    for (k,v) ∈ tokens # iterate over the tokens
        inverse[v] = k; # add the token to the dictionary
    end
    document.inverse = inverse; # set the data on the document


    # return -
    return document;
end

function build(model::Type{MyMoviewReviewDocumentCorpusModel}, 
    records::Dict{Int64, MyMoviewReviewDocumentModel})::MyMoviewReviewDocumentCorpusModel
    
    # initialize -
    corpus = MyMoviewReviewDocumentCorpusModel(); # build an empty corpus model
    tokenset = Set{String}(); # build an empty set
    corpus_tokens::Dict{String,Int64} = Dict{String,Int64}(); # build an empty dictionary

    # first, set the records field on the corpus -
    corpus.records = records;

    # process each record, and build the overall list of tokens for this corpus -
    for (_, document) ∈ records # iterate over the tokens in the records
        for token ∈ document.tokenset # iterate over the tokens in the records
            push!(tokenset, token); # add the token to the tokenset
        end
    end

    # build an ordering for the tokens -
    token_array = collect(tokenset) |> sort; # convert the set to an array, and sort it
    for i ∈ eachindex(token_array) # iterate over the tokens
        token = token_array[i]; # get the token
        corpus_tokens[token] = i; # add the token to the corpus tokens
    end
    corpus.tokens = corpus_tokens; # set the data on the corpus

    # return -
    return corpus;
end