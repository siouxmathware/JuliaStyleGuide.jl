using JuliaStyleGuide
using Documenter
using DocumenterTools: Themes

include("make_julia_for_numpy_users.jl")

Themes.compile(joinpath(@__DIR__,"src/assets/light.scss"), joinpath(@__DIR__,"src/assets/themes/documenter-light.css"))

makedocs(;
    clean=true,
    modules=[JuliaStyleGuide],
    repo="github.com/siouxmathware/JuliaStyleGuide.jl/{commit}/{path}#lines-{line}",
    sitename="JuliaStyleGuide.jl",
    format=Documenter.HTML(;
        prettyurls=!("local" in ARGS), canonical="", edit_link="master"
    ),
    pages=[
        "Home" => "index.md",
        "Testing" => "testing.md",
        "Documentation" => "documentation.md",
        "Package interface and dependencies" => "package_interface_and_dependencies.md",
        "Nested Include" => "nested_includes.md",
        "Types and Their Methods" => "types_and_their_methods.md",
        "Docstrings" => "docstrings.md",
        "Julia for Numpy users" => "julia_for_numpy_users.md",
    ],
)

deploydocs(; repo="github.com/siouxmathware/JuliaStyleGuide.jl.git", devbranch="housestyle")
