# -- PRIVATE METHODS BELOW HERE ------------------------------------------------------------------------------------ #
function _build(modeltype::Type{T}, data::NamedTuple)::T where T<:MyAbstractRecordType
    
    # build an empty model
    model = modeltype();

    # if we have options, add them to the contract model -
    if (isempty(data) == false)
        for key ∈ fieldnames(modeltype)
            
            # check the for the key - if we have it, then grab this value
            value = nothing
            if (haskey(data, key) == true)
                # get the value -
                value = data[key]
            end

            # set -
            setproperty!(model, key, value)
        end
    end
 
    # return -
    return model
end
# -- PRIVATE METHODS ABOVE HERE ------------------------------------------------------------------------------------ #

# -- PUBLIC METHODS BELOW HERE ------------------------------------------------------------------------------------- #

# ADVANCED: what is going on here? 
build(model::Type{T}, data::NamedTuple) where T<:MyAbstractRecordType = _build(model, data)
# -- PUBLIC METHODS ABOVE HERE ------------------------------------------------------------------------------------- #
