include("Include.jl")

# build lists or positive and negative movie review files -
list_of_positive_review_files = readdir(_PATH_TO_POSITIVE_REVIEWS);
lod = readfiles(list_of_positive_review_files, base = _PATH_TO_POSITIVE_REVIEWS, delim = " ");




