using JuliaStyleGuide
using Documenter

include("make_table.jl")

makedocs(;
    clean=true,
    modules=[JuliaStyleGuide],
    repo="https://bitbucket.org/limebv/project/juliastyleguide.jl/{commit}/{path}#lines-{line}",
    sitename="JuliaStyleGuide.jl",
    format=Documenter.HTML(
        prettyurls=!("local" in ARGS),
        canonical="",
        edit_link="master"
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
    ]
)

make_table(joinpath("docs", "build", "julia_for_numpy_users", "index.html"))

deploydocs(; 
    repo = "github.com/siouxmathware/JuliaStyleGuide.jl.git",
    devbranch = "html-table"
)