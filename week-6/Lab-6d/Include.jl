# setup paths -
const _ROOT = @__DIR__
const _PATH_TO_DATA = joinpath(_ROOT, "data")
const _PATH_TO_SRC = joinpath(_ROOT, "src");

# check: do we have all the packages installed? If not, install them
using Pkg
Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();

# load external packages -
using Graphs
using TOML
using JSON
using CSV
using DelimitedFiles
using DataStructures
using Test

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Compute.jl"));
include(joinpath(_PATH_TO_SRC, "Traversal.jl"));