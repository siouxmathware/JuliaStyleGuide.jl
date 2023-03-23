include("TableMaker.jl")
using .TableMaker
general_purpose_table = TableMaker.ComparisonTable(
    "# General Purpose Equivalents", 
    (p="Python", j="Julia", n="Note"), 
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"), 
    [
        (p="import package", j="import Pkg", n="Import a package, requiring qualified names"), 
        (p="from package import *", j="using Pkg", n="Import the contents of a package, populating your namespace"),
        (p="from package import C, f", j="using Pkg: C, f", n="Import items from a package, populating your namespace"), 
        (p="from package import C, f", j="import Pkg: C, f", n="Import items from a package, populating your namespace, _allows extending the functions with new methods_"), 
        (p="from package import *", j="using Pkg", n="Import all _exported_ contents of a package, populating your namespace, Julia community standard, but not recommended"),
        (p="info(func)\nhelp(func)\nfunc?  # IPython", j="?func", n="get help on the function f"), 
    ]
)
linear_algebra_table = TableMaker.ComparisonTable(
    "# Linear Algebra Equivalents", 
    (p="Python", j="Julia", n="Note"), 
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"), 
    [
        (p="import linalg from numpy", j="import LinearAlgebra as LA", n="Loading extra functionality"), 
        (p="np.ndim(a)\na.ndim", j="ndims(a)", n="Number of dimensions of array `a`"),
    ]
)
TableMaker.make_markdown(
    [general_purpose_table, linear_algebra_table], 
    joinpath("docs", "src", "julia_for_numpy_users.md")
)
