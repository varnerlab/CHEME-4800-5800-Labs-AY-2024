# setup paths -
const _ROOT = @__DIR__
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")

# check: do we have the required packahes loaded??
using Pkg
Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();

# load external packages -
using Graphs; # this is a 3rd party package for graphs
using GraphIO; # this is a 3rd party package for graph io
using Karnak; # this is a 3rd party package for graph drawing
using Colors; # this is a 3rd party package for colors
using NetworkLayout; # this is a 3rd party package for network layout algorithms
using Test; 

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Files.jl"));
include(joinpath(_PATH_TO_SRC, "Compute.jl"));