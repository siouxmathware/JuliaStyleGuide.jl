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
        (p="np.size(a) or a.size", j="length(a)", n="number of elements of array a"),
        (p="np.shape(a) or a.shape", j="size(a)", n="“size” of array a"),
        (p="a.shape[n-1]", j="size(a)[n]", n="get the number of elements of the n-th dimension of array a."),
        (p="np.array([[1., 2., 3.], [4., 5., 6.]])", j="[[1 2 3];[4 5 6]]", n="define a 2x3 2D array"),
        (p="np.block([[a, b], [c, d]])", j="[[a b]; [c d]]", n="construct a matrix from blocks a, b, c, and d"),
        (p="a[-1]", j="a[end]", n="access last element in 1D array a"),
        (p="a[1, 4]", j="a[2, 5]", n="access element in second row, fifth column in 2D array a"),
        (p="a[1] or a[1, :]", j="a[2, :]", n="entire second row of 2D array a"),
        (p="a[0:5] or a[:5] or a[0:5, :]", j="a[1:5, :]", n="first 5 rows of 2D array a"),
        (p="a[-5:]", j="a[end-4:end, :]", n="last 5 rows of 2D array a"),
        (p="a[0:3, 4:9]", j="a[1:3, 5:9]", n="The first through third rows and fifth through ninth columns of a 2D array, a."),
        (p="a[2:21:2,:]", j="a[3:2:21, :]", n="every other row of a, starting with the third and going to the twenty-first"),
        (p="a[::2, :]", j="a[:2:end, :]", n="every other row of a, starting with the first"),
        (p="a[::-1,:]", j="a[end:-1:1, :]", n="a with rows in reverse order"),
        (p="a.transpose() or a.T", j="transpose(a)", n="transpose of a"),
        (p="a.conj().transpose() or a.conj().T", j="a’", n="conjugate transpose of a"),
        (p="a @ b", j="a*b", n="matrix multiply"),
        (p="a * b", j="a.*b", n="element-wise multiply"),
        (p="a/b", j="a./b", n="element-wise divide"),
        (p="a**3", j="a.^3", n="element-wise exponentiation "),
        (p="(a > 0.5)", j="x a .> 0.5", n="matrix whose i,jth element is (a_ij > 0.5)."),
        (p="np.nonzero(a > 0.5)", j="findall(ax .> 0.5)", n="find the indices where (a > 0.5)"),
        (p="a[:,np.nonzero(v > 0.5)[0]]", j="a[:, LinearIndices(findall(v .> 0.5))]", n="extract the columns of a where vector v > 0.5"),
        (p="a[:, v.T > 0.5]", j="a[:, LinearIndices(findall(v .> 0.5))] ", n="extract the columns of a where column vector v > 0.5"),
        (p="a[a < 0.5]=0", j="a[a .< 0.5] .= 0", n="a with elements less than 0.5 zeroed out"),
        (p="a * (a > 0.5)", j="a .* (a .> 0.5)", n="a with elements less than 0.5 zeroed out"),
        (p="a[:] = 3", j="a .= 3", n="set all values to the same scalar value"),
        (p="y = x.copy()", j="y = copy(x)", n="Get copy"),
        (p="y = x[1, :].copy()", j="y = x[1, :]", n="NumPy slices are by reference, Julia slices are by copy"),
        (p="y = x[1, :]", j="@view y = x[1, :]", n="@view macro changes slices into Views (references)"),
        (p="y = x.flatten()", j="x[:]", n="turn array into vector, note that Julia uses column-major order"),
        (p="np.arange(1., 11.)", j="1:10", n="create an increasing vector"),
        (p="np.arange(10.)", j="0:10", n="create an increasing vector"),
        (p="np.arange(1.,11.)[:, np.newaxis]", j="1:10", n="create a column vector"),
        (p="np.arange(1.,11.)", j="(1:10)’", n="create a row vector"),
        (p="np.zeros((3, 4))", j="zeros(3, 4)", n="3x4 two-dimensional array full of 64-bit floating point zeros"),
        (p="np.ones((3, 4))", j="ones(3, 4)", n="3x4 two-dimensional array full of 64-bit floating point ones"),
        (p="""
np.eye(3)
""",
j="""
UniformScaling(1) or 
using LinearAlgebra; I
""",
n="""
3x3 identity matrix.
"""),
        (p="np.diag(a)", j="diag(a)", n="#3"),
        (p="np.diag(v, 0)", j="Diagonal(a) or diagm(a)", n="#3"),
        (p="""
from numpy.random import default_rng

rng = default_rng(42)
rng.random(3, 4)
"""),
(p="""
using Random

rng = Xoshiro(42)
rand(Float64, (3,4)) 
""",
n="""
generate a random 3x4 array with default random number generator and seed = 42
"""),
(p="""
np.linspace(1,3,4)
""",
j="""
range(1,3, length=4) or
range(start=1, stop=3, length=4)
""",
n="""
4 equally spaced samples between 1 and 3, inclusive
"""),
(p="""
np.mgrid[0:9.,0:6.]
""",
j="""
Using LazyGrids

ndgrid(0:8, 0:5)
""",
n="""
two 2D arrays: one of x values, the other of y values
"""),
(p="""
np.meshgrid([1,2,4],[2,4,5])
""",
j="""
Using LazyGrids

ndgrid([1, 2, 4], [2, 4, 5])
""",
n="""

"""),
        (p="np.tile(a, (m, n))", j="repeat(a, m, n)", n="create m by n copies of a"),
        (p="""
np.concatenate((a,b),1) or np.hstack((a,b)) or np.column_stack((a,b))
""",
j="""
hcat(a, b) or
[a b] or
cat(a, b, ; dims=2)
""",
n="""
concatenate columns of a and b
"""),
(p="""
np.concatenate((a,b)) or np.vstack((a,b))
""",
j="""
vcat(a, b) or
[a; b] or
cat(a, b;, dims=1)
""",
n="""
concatenate rows of a and b
"""),
        (p="a.max()", j="maximum(a)", n=""),
        (p="""
np.nanmax(a)
""",
j="""
maximum(filter(!isnan, a)) or 
maximum(x->isnan(x) ? -Inf : x, a)
""",
n="""
maximum element of a, ignoring NaN.
Note that the second Julia option does not allocate an intermediate array.
"""), 
        (p="a.max(0)", j="maximum(a;, dims=1)", n="maximum element of each column of array a"),
        (p="a.max(1)", j="maximum(a;, dims=2)", n="maximum element of each row of array a"),
        (p="np.maximum(a, b)", j="max.(a, b)", n="compares a and b element-wise, and returns the maximum value from each pair"),
        (p="""
np.sqrt(v @ v) or np.linalg.norm(v)
""",
j="""
using LinearAlgebra
norm(v)
""",
n="""
L2 norm of vector v
"""),
        (p="logical_and(a,b)", j="a .&& b ", n="element-by-element AND operator"),
        (p="np.logical_or(a,b)", j="a .|| b", n="element-by-element OR operator"),
        (p="a & b", j="a & b", n="bitwise AND operator"),
        (p="a | b", j="a | b", n="bitwise OR operator"),
        (p="linalg.inv(a)", j="inv(a)", n="inverse of square 2D array a"),
        (p="""
linalg.pinv(a)
""",
j="""
using LinearAlgebra
pinv(v)
""",
n="""
pseudo-inverse of 2D array a
"""),
(p="""
np.linalg.matrix_rank(a)
""",
j="""
using LinearAlgebra
rank(v)
""",
n="""
matrix rank of a 2D array a
"""),
        (p="linalg.solve(a, b) if a is square; linalg.lstsq(a, b) otherwise", j="a \ b", n="solution of a x = b for x"),
        (p="""
U, S, Vh = linalg.svd(a);
V = Vh.T
""",
j="""
using LinearAlgebra
F = svd(a)
U, S, V = F; or
Uonly, = svd(a)
""",
n="""
singular value decomposition of a
"""),
(p="""
linalg.cholesky(a)
""",
j="""
using LinearAlgebra
cholesky(a)
""",
n="""
Cholesky factorization of a 2D array
"""),
(p="""
D,V = linalg.eig(a)
""",
j="""
using LinearAlgebra 
F = eigen(a)
vals, vecs = F;
""",
n="""
Eigenvalues λ and eigenvectors v of a, where av=λv
"""),
(p="""
D,V = linalg.eig(a, b)
""",
j="""
using LinearAlgebra 
F = eigen(a, b)
vals, vecs = F;
""",
n="""
Eigenvalues λ and eigenvectors v of a, b; where av=λbv
"""),
(p="""
D,V = eigs(a, k=3)
""",
j="""
using LinearAlgebra 
F = eigen(a, rank(x)-2:rank(x))
vals, vecs = F;
""",
n="""
find the k=3 largest eigenvalues and eigenvectors of 2D array, a
"""),
    ]
)

TableMaker.make_markdown(
    [general_purpose_table, linear_algebra_table], 
    joinpath("docs", "src", "julia_for_numpy_users.md")
)
