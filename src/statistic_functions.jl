#---
using Test

#---
"""
    rse_sum(x::Vector)::Real

Return the sum of elements in a Vector.

# Arguments

- `x` -- Vector

# Output

A real number representing the sum of elements.

# Notes

I mean, it's a sum. Not rocket science.

# Examples

```julia-repl
julia> rse_sum(1:3)
6
\```

See also [`rse_mean`](@rse_mean), [`rse_std`](@rse_std), [`rse_tstat`](@rse_tstat).
"""
function rse_sum(x)
    sum = 0
    for arg = x
        sum += arg
    end
    return sum
end

#---
"""
    rse_mean(x::Vector)::Real

Return the mean of elements in a Vector.

# Arguments

- `x` -- Vector

# Output

A real number representing the mean of elements.

# Notes

I mean, it's a mean. Not rocket science.

# Examples

```julia-repl
julia> rse_mean(1:3)
2
\```

See also [`rse_sum`](@rse_sum), [`rse_std`](@rse_std), [`rse_tstat`](@rse_tstat).
"""
function rse_mean(x)
    return rse_sum(x) / length(x)
end

#---
@doc raw"""
    rse_std(x::Vector)::Real

Return the standard deviation of elements in a Vector.

# Arguments

- `x` -- Vector

# Output

A real number representing the standard deviation of elements.

# Notes

Calculates by the following formula: \sqrt{\frac{\sum((x-mean(x))^2)}{n-1}}

# Examples

```julia-repl
julia> rse_std(1:3)
1
\```

See also [`rse_sum`](@rse_sum), [`rse_mean`](@rse_mean), [`rse_tstat`](@rse_tstat).
"""
function rse_std(x)
    return sqrt(rse_sum((x .- rse_mean(x)) .^ 2) / (length(x) - 1))
end

#---
@doc raw"""
    rse_tstat(x::Vector,[σ]::Real=nothing)::Real

Return the t-value of elements in a Vector.

# Arguments

- `x` -- Vector

# Output

A real number representing the t-value of elements.

# Notes

Calculates by the following formula: \frac{mean(x)}{std(x) / (sqrt(length(x)))}

# Examples

```julia-repl
julia> rse_tstat(2:3)
5
\```

See also [`rse_sum`](@rse_sum), [`rse_mean`](@rse_mean), [`rse_std`](@rse_std).
"""
function rse_tstat(x; σ=nothing)
    if σ != isnothing
        σ = rse_std(x)
    end
    return rse_mean(x) ./ (σ ./ sqrt.(length(x)))
end

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
