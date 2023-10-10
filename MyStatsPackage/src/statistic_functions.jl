#---
using Test

#---
function rse_sum(args)
    sum = 0
    for arg = args
        sum += arg
    end
    return sum
end

#---
@test rse_sum(1:36) == 666

#---
function rse_mean(args)
    return rse_sum(args) / length(args)
end

#---
@test rse_mean(-15:17) == 1

#---
function rse_std(args)
    return sqrt(rse_sum((args .- rse_mean(args)) .^ 2) / (length(args) - 1))
end

#---
@test rse_std(1:3) == 1

#---
function rse_tstat(args; σ=nothing)
    if σ != isnothing
        σ = rse_std(args)
    end
    return rse_mean(args) ./ (σ ./ sqrt.(length(args)))
end

#---
@test rse_tstat(2:3) == 5.0

#---
struct StatResult
    x::Vector
    n::Int64
    std::Float64
    tvalue::Float64
end

function StatResult(x)
    n = length(x)
    std = rse_std(x)
    tvalue = rse_tstat(x)
    return StatResult(x, n, std, tvalue)
end
