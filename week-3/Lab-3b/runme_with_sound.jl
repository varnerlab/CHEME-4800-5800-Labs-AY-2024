# include the include.jl file -
include("Include.jl");

# load the sounds library -
sound_dictionary = Dict{Int64, Tuple{Matrix{Float64}, Float32}}()
number_of_samples = 21;
for i ∈ 1:number_of_samples
    filename = joinpath(_PATH_TO_SOUNDS, "example-$(i).wav")
    y, fs = wavread(filename)
    sound_dictionary[i] = (y, fs)
end

# create an array of random numbers -
random_input_array = rand(1:21, 5);
random_input_array_sorted = sort(random_input_array);
sorted_output_array = bubble_sort(random_input_array; sounds=sound_dictionary)