# `Lab-4d`: Working with text data files. Movie reviews and sentiment analysis
The objective of `lab-4d` is to familiarize students with working with text documents and a simple [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing) model called the [bag of words](https://en.wikipedia.org/wiki/Bag-of-words_model).

* Ultimately, we will build a system that can classify text as either positive or negative in tone, called [sentiment analysis](https://en.wikipedia.org/wiki/Sentiment_analysis). However, for now let's start by introducing some basic ideas in [natural language processing (NLP)](https://en.wikipedia.org/wiki/Natural_language_processing).

## Data
We'll use the [Cornell movie review v2.0 data set](http://www.cs.cornell.edu/people/pabo/movie-review-data) as our `corpus`. This data set was introduced and analyzed in [Pang/Lee ACL 2004](https://aclanthology.org/P04-1035/). This data set contains 1000 positive and 1000 negative movie reviews.

## Prerequisite 
Break up into teams of 2-3 people and take `5 min` to walk through all the files (starting with `Include.jl` in the `root` directory) in `Lab-4d`. At the end of `5 min`, we'll do a class Q&A to ensure everyone understands the purpose of each file.

### Tasks
1. Break up into groups and finish implementing the `load_review_file` function in `Files.jl`. The `load_review_file` function reads a text file and returns each line as an entry in a dictionary. 
1. Load the `cv002_15918.txt` file in the positive reviews directory. 
1. Analyze the word frequency for `cv002_15918.txt` (fill in the `runme.jl` script):
    * Finish implementing the `compute_bag_of_words` function in the `Compute.jl` file. The `compute_bag_of_words` function returns a dictionary with the words as keys and the counts as values.
    * Use the `frequency` function in the `Compute.jl` file to compute the frequency of word use. 
1. Let's look at what words are important using the `maximum` function in `Compute.jl`