include("Include.jl")

# setup file path -
path_to_test_review_file = joinpath(_PATH_TO_POSITIVE_REVIEWS, "cv001_18431.txt")

# load -
d = readfile(path_to_test_review_file);