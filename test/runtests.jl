using MyStatsPackage # here it is ok to use, don't put it in your "debug"-convenience setup.jl
include("./setup.jl")


@testset "statistics" begin
    include("./statistics.jl")
end
