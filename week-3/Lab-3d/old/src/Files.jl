


"""
    parsefile(filepath::String, fieldtypes::Dict{Int, Pair{String,Type}}; delim::Char=',', 
        header::Bool = true, verbose::Bool = false) -> Dict{Int, MyTreasuryDataRecordType}
"""
function parsefile(filepath::String, fieldtypes::Dict{Int, Pair{String,Type}}; delim::Char=',', 
    header::Bool = true, verbose::Bool = false)::Dict{Int64, MyTreasuryDataRecordType}
    
    # TODO: check that file path is legit, if not throw an error?
    # ...
    
    # initialize -
    linecounter = 1;
    records = Dict{Int64, MyTreasuryDataRecordType}()
    df = dateformat"mm/dd/yyyy"; # the date format

    # how many fields do we have?
    number_of_fields = length(fieldtypes);
    field_symbol_array = Array{Symbol, 1}();
    for i ∈ 1:number_of_fields
        
        # get the field name, and type -
        fieldname, _ = fieldtypes[i];
        field_symbol_array = push!(field_symbol_array, Symbol(fieldname))
    end
    
    open(filepath) do file
        for line in eachline(file)
            
            if (header == true && linecounter == 1)
                # skip the header -
                linecounter += 1;
                continue # magic, you should check this out!
            end

            # split the line -
            parts = split(line, delim) .|> String

            # process the fields -
            fieldcounter = 1;
            valuearray = Array{Union{String, Float64, Date, Nothing}, 1}();
            for part in parts
                if (verbose == true)
                    println("Line: ", linecounter, " Field: ", fieldcounter, " Value: ", part)
                end
                
                _,fieldtype = fieldtypes[fieldcounter];
                
                # convert the part to the correct type -
                newpart = nothing;
                if (fieldtype == Float64 && part != "")
                    newpart = parse(Float64, part);
                elseif (fieldtype == Date && part != "")
                    newpart = Dates.Date(part, df);
                elseif (fieldtype == Int64 && part != "")
                    newpart = part;
                elseif (fieldtype == String && part != "")
                    newpart = part;
                end

                # add the newpart to the value array -
                push!(valuearray, newpart);

                # update the field counter -
                fieldcounter += 1;
            end

            # ok, create a data tuple -
            data_tuple = NamedTuple{Tuple(field_symbol_array)}(valuearray);

            # build the record -
            records[linecounter] = build(MyTreasuryDataRecordType, data_tuple)
            
            # update the linecounter -
            linecounter += 1;
        end
    end

    # return -
    return records
end