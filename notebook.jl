### A Pluto.jl notebook ###
# v0.19.29

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 84348826-6820-11ee-1d89-e966123fae6f
begin
	import Pkg
	Pkg.activate(".")
end

# ╔═╡ ff5d74a0-5d59-446a-94f3-d36de8efdcea
using CairoMakie

# ╔═╡ c8856065-b170-4ff4-9d08-0281fcb76e01
using PlutoUI

# ╔═╡ cfe5367a-8a60-4549-869a-77a7960f9ce1
using StableRNGs

# ╔═╡ e41ff950-c541-4606-8ecf-d6aa028ac324
using MyStatsPackage

# ╔═╡ 9e922f42-a37a-4266-b307-0610fb32c76c
@bind scalingFactor PlutoUI.Slider(1:50)

# ╔═╡ b190b341-f6d7-4923-8c43-3fd3278a9dbd
function simulate(randomSeed::Real, numberOfSamples::Int)
	samples = randn(StableRNG(randomSeed),numberOfSamples)
	standardDeviation = rse_std(samples*scalingFactor)
	if isapprox(standardDeviation,10;atol=0.1)
		samples = samples .*scalingFactor
		return samples
	end
end

# ╔═╡ 9d212ec7-f0ed-4a83-b18d-596368a2201e
scaledSamples = simulate(1337, 500)

# ╔═╡ 9d6543bc-7942-41dd-b8e0-414fcc43504f


# ╔═╡ Cell order:
# ╠═84348826-6820-11ee-1d89-e966123fae6f
# ╠═ff5d74a0-5d59-446a-94f3-d36de8efdcea
# ╠═c8856065-b170-4ff4-9d08-0281fcb76e01
# ╠═cfe5367a-8a60-4549-869a-77a7960f9ce1
# ╠═e41ff950-c541-4606-8ecf-d6aa028ac324
# ╠═9e922f42-a37a-4266-b307-0610fb32c76c
# ╠═b190b341-f6d7-4923-8c43-3fd3278a9dbd
# ╠═9d212ec7-f0ed-4a83-b18d-596368a2201e
# ╠═9d6543bc-7942-41dd-b8e0-414fcc43504f
