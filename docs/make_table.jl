include("TableMaker.jl")
using .TableMaker
ct = TableMaker.ComparisonTable((a="Python", b="Julia", c="Note"), (a="1{}1", b="2{}2", c="3{}3"), [(a="1", b="2", c="3"), (a="a", b="b", c="c")])
TableMaker.make_markdown(ct, joinpath("docs", "src", ".julia_for_numpy_users.md"))
