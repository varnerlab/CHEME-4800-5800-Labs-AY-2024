include("Include.jl")

# build lists or positive and negative movie review files -
list_of_positive_review_files = readdir(_PATH_TO_POSITIVE_REVIEWS);
list_of_positive_documents = Dict{Int64, MyMoviewReviewDocumentModel}();
for i ∈ eachindex(list_of_positive_review_files)
    filename = list_of_positive_review_files[i];
    # setup file path -
    path_to_review_file = joinpath(_PATH_TO_POSITIVE_REVIEWS, filename)

    # read the file -
    list_of_positive_documents[i] = readfile(path_to_review_file);
end
# positive_corpus_model = build(MyMoviewReviewDocumentCorpusModel, list_of_positive_documents);



