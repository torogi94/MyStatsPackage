using Documenter, Example, MyStatsPackage
makedocs(
    sitename="MyStatsPackage.jl",
    modules=[MyStatsPackage],
    pages=Any[
        "Home"=>"index.md",
        "Showcase"=>"showcase.md",
    ],
)
