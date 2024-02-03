# `Lab-3b`: Introduction to simple sorting algortihms using `for` loops
The objective of `lab-3b` is to give students practice with understanding and analyzing simple sorting algorithms that rely on `for` loops and conditional comparisons to order the elements of ordered collections such as [arrays](https://docs.julialang.org/en/v1/base/arrays/). In this lab, we will focus on two simple sorting algorithms:

* [Bubble sort](https://www.youtube.com/watch?v=uJLwnsLn0_Q) is a simple sorting algorithm that repeatedly steps through the arrays, compares adjacent elements and swaps them if they are in the wrong order, i.e., if the first element is larger than the second element. The worst-case time complexity of [Bubble sort](https://www.youtube.com/watch?v=uJLwnsLn0_Q) is $\mathcal{O}(n^2)$, where $n$ is the number of elements in the unsorted list. 
* [Insertion sort](https://www.youtube.com/watch?v=nKzEJWbkPbQ) performs shift operations to sort a random list into ascending order. The worst-case time complexity of [Insertion sort](https://www.youtube.com/watch?v=nKzEJWbkPbQ) is $\mathcal{O}(n^2)$, where $n$ is the number of elements in the unsorted list.

Both of these approaches are much less efficient on large arrays than advanced algorithms such as [quicksort](https://en.wikipedia.org/wiki/Quicksort), [heapsort](https://en.wikipedia.org/wiki/Heapsort), or [merge sort](https://en.wikipedia.org/wiki/Merge_sort). However, they are simple to understand and implement, and are useful for small data sets or data sets that are nearly sorted.

## Prerequisite 
Break up into teams of 2-3 people and take `5 min` to walk through all the files (starting with `Include.jl` in the `root` directory) in `Lab-3b`. At the end of `5 min`, we'll do a class Q&A to ensure everyone understands the purpose of each file

In `lab-3b`, you will create lists of random numbers of different lengths and compute how long it takes to sort these lists using different sorting algorithms using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package.