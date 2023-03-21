using JuliaStyleGuide
using Documenter

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

# see https://discourse.julialang.org/t/documenter-devbranch-build-not-deploying/92020/2
if get(ENV, "GITHUB_EVENT_NAME", nothing) == "workflow_dispatch"
    ENV["GITHUB_EVENT_NAME"] = "push"
end
deploydocs(
    repo = "github.com/siouxmathware/JuliaStyleGuide.jl.git",
)