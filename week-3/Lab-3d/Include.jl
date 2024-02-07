# setup paths -
const _ROOT = @__DIR__
const _PATH_TO_SRC = joinpath(_ROOT, "src");
const _PATH_TO_DATA = joinpath(_ROOT, "data");

# download required packages -
import Pkg
Pkg.activate("."); Pkg.resolve(); Pkg.instantiate(); Pkg.update();

# load required packages -
using Dates
using Test
using NamedTupleTools

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"));
include(joinpath(_PATH_TO_SRC, "Factory.jl"));
include(joinpath(_PATH_TO_SRC, "Files.jl"));