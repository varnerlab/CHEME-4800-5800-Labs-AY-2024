# setup paths -
const _ROOT = @__DIR__
const _PATH_TO_SRC = joinpath(_ROOT, "src");

# check: do we have the required packahes loaded??
using Pkg
Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();

# load external packages -
using LinearAlgebra;
using Test;
using UnicodePlots;
using Plots;
using Colors;

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Solvers.jl"));
include(joinpath(_PATH_TO_SRC, "Memory.jl"));