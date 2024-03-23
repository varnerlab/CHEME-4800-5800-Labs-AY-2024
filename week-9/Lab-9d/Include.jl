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
using DifferentialEquations;

# uncomment me if you want to use Plots.jl for optional plotting
using Plots;
using Colors;

# load my codes -
include(joinpath(_PATH_TO_SRC, "Kompala.jl"));