module MyStatsPackage

using Test
include("./statistic_functions.jl")
export rse_sum, rse_mean, rse_std, rse_tstat
export StatResult

function printOwner()
    print("torogi94")
end

end # module MyStatsPackage
