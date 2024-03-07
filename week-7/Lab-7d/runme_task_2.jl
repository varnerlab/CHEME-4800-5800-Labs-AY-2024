# include -
include("Include.jl")

# build a graph from the network file -
path_to_test_file = joinpath(_PATH_TO_DATA, "Network.net");

# build the reaction list -
R = readreactionfile(path_to_test_file, comment="//");

# build the graph -
S = build(MyStoichiometricMatrixModel, R);
B = binary_stoichiometric_matrix(S.matrix);
A = transpose(B)*B;

edge_list = Array{Tuple{Int,Int},1}();
number_of_rows = length(A[:,1]); # we could use size(A,1) as well
for i ∈ 1:number_of_rows
    index_connections = findall(x-> x!==0, A[i,:]);
    for j ∈ index_connections
        if (i ≠ j)
            push!(edge_list, (i,j))
        end
    end
end
E = Edge.(edge_list);
g = SimpleGraph(E);

Drawing(300,300, "EcoliNetwork.pdf")
origin()
background("grey10")
sethue("orange")
drawgraph(g, 
    edgelabels = :none, edgecurvature=0, layout = stress,
    vertexshapesizes = 0.1, 
    vertexfillcolors = (v) -> mod(v,2) == 0 && colorant"lightskyblue",
    edgestrokeweights=0.1);
finish()