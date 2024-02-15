# `Lab-4d`: Working with text data files. Movie reviews and sentiment analysis
Ultimately, we will build a system that can classify text as either positive or negative in tone, called [sentiment analysis](https://en.wikipedia.org/wiki/Sentiment_analysis). However, for now let's start by introducing some basic ideas in [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing). The objective of `lab-4d` is to familiarize students with working with text documents and a simple [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing) model called the [bag of words](https://en.wikipedia.org/wiki/Bag-of-words_model).

### Data
We'll use the [Cornell movie review v2.0 data set](http://www.cs.cornell.edu/people/pabo/movie-review-data) as our `corpus`. This data set was introduced and analyzed in [Pang/Lee ACL 2004](https://aclanthology.org/P04-1035/). This data set contains 1000 positive and 1000 negative movie reviews.

## Prerequisite 
Break up into teams of 2-3 people and take `5 min` to walk through all the files (starting with `Include.jl` in the `root` directory) in `Lab-4d`. At the end of `5 min`, we'll do a class Q&A to ensure everyone understands the purpose of each file.

## Tasks
1. Break up into groups and finish implementing the `readfiles` function in `Files.jl`, and any other associated functions that are called by `readfiles`.
* The `readfiles` function reads an array of move review file names and returns a `Dict{Int, MyMoviewReviewDocumentModel}` where the key is the index of the review file and the value is a `MyMoviewReviewDocumentModel` object.