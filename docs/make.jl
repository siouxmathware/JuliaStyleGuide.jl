using JuliaStyleGuide
using Documenter

makedocs(;
    clean=true,
    modules=[JuliaStyleGuide],
    repo="",
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
        "Docstrings" => "docstrings.md",
    ]
)
