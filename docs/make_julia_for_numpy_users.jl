include("TableMaker.jl")
using .TableMaker
ct = TableMaker.ComparisonTable(
    (p="Python", j="Julia", n="Note"), 
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"), 
    [
        (p="import package", j="import Pkg", n="3"), 
        (p="from package import *", j="using Pkg", n="c")
    ]
)
TableMaker.make_markdown(ct, joinpath("docs", "src", "julia_for_numpy_users.md"))
