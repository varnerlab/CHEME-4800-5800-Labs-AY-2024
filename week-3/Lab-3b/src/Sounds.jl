function play_sound(array::Array{T,1}; sounds::Union{Nothing, Dict{Int64, Tuple{Matrix{Float64}, Float32}}} = nothing)::Nothing where T <: Number


    if (sounds !== nothing)
        
        # initialize -
        N = length(array) # how many elements in the array?

        # play the sounds -
        for k ∈ 1:N
            y, fs = sounds[array[k]]
            wavplay(y, fs)
        end  
    end

    # return sorted array -
    return nothing
end