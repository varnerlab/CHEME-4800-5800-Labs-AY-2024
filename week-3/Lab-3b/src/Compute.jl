"""
    bubble_sort(array::Array{T,1})::Array{T,1} where T <: Number

Sorts an `array` of `Numbers` into ascending order using the `Bubble Sort` algorithm. \\
This is a `non-mutating` function.

### Arguments
- `array::Array{T,1}`: the array to be sorted where `T` is a subtype of `Number`.

### More information
* Algorithm: https://en.wikipedia.org/wiki/Bubble_sort
"""
function bubble_sort(array::Array{T,1}; 
    sounds::Union{Nothing, Dict{Int64, Tuple{Matrix{Float64}, Float32}}} = nothing)::Array{T,1} where T <: Number

    # initialize -
    arr = copy(array) # make a copy of the array
    N = length(arr) # how many elements in the array?

    # main -
    for i ∈ 1:N

        
        if (sounds !== nothing)
            @show i, arr
            play_sound(arr; sounds=sounds)
        end
        
        for j ∈ 1:N-i
            if arr[j] > arr[j+1]

                # swap that values at j and j+1
                tmp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = tmp

                # fancy impl (but hard to understand)
                # arr[j], arr[j+1] = arr[j+1], arr[j] # check: what is this line doing?
            end
        end
    end

    # return sorted array -
    return arr
end

"""
    bubble_sort!(array::Array{T,1})::Array{T,1} where T <: Number

Sorts an `array` of `Numbers` into ascending order using the `Bubble Sort` algorithm. \\
This is a `mutating` function.

### Arguments
- `array::Array{T,1}`: the array to be sorted where `T` is a subtype of `Number`.

### More information
* Algorithm: https://en.wikipedia.org/wiki/Bubble_sort
"""
function bubble_sort!(array::Array{T,1}; 
    sounds::Union{Nothing, Dict{Int64, Tuple{Matrix{Float64}, Float32}}} = nothing)::Array{T,1} where T <: Number

    # initialize -
    arr = copy(array) # make a copy of the array
    N = length(arr) # how many elements in the array?
    sorted_table = DataFrame();

    # main -
    for i ∈ 1:N
        for j ∈ 1:N-i
            if arr[j] > arr[j+1]

                # swap that values at j and j+1
                tmp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = tmp

                if (sounds !== nothing)
                    @show i, j, j+1, arr
                    play_sound(arr; sounds=sounds)
                end

                # fancy impl (but hard to understand)
                # arr[j], arr[j+1] = arr[j+1], arr[j] # check: what is this line doing?
            end
        end
    end

    # return sorted array -
    return arr
end