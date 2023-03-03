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
    ]
)
