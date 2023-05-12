include("TableMaker.jl")
using .TableMaker

general_purpose_table = TableMaker.ComparisonTable(
    "## General Purpose",
    (p="Python", j="Julia", n="Note"),
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"),
    [
        (
            p="import package",
            j="import Pkg",
            n="Import a package, requiring qualified names",
        ),
        (
            p="from package import *",
            j="using Pkg",
            n="Import the contents of a package, populating your namespace",
        ),
        (
            p="from package import C, f",
            j="using Pkg: C, f",
            n="Import items from a package, populating your namespace",
        ),
        (
            p="from package import C, f",
            j="import Pkg: C, f",
            n="Import items from a package, populating your namespace, _allows extending the functions with new methods_",
        ),
        (
            p="from package import *",
            j="using Pkg",
            n="Import all _exported_ contents of a package, populating your namespace, Julia community standard, but not recommended",
        ),
        (
            p="info(func)\nhelp(func)\nfunc?  # IPython",
            j="?func",
            n="get help on the function f",
        ),
        (
            p="""
            for i in range(1, 4):
                print(i)
            """,
            j="""
            for i in 1:3
                println(i )
            end
            """,
            n="""
            use a for-loop to print the numbers 1, 2, and 3 using range
            """,
        ),
        (
            p="""
            a = 4
            if a == 4:
                print('a = 4')
            elif a == 5:
                print('a = 5')
            """,
            j="""
            a = 4
            if a == 4
                println(“a = 4”)
            elseif a == 5
                print(“a = 5”)
            end
            """,
            n="""
            create an if-else statement to check if a is 4 or 5 and print result
            """,
        ),
        (p="1j", j="1im", n="complex numbers "),
        (
            p="np.finfo(float).eps  # or\n np.spacing(1)",
            j="eps(Float64)  # or\n eps(1.0)",
            n="distance from 1 to the next larger representable real number in double precision",
        ),
    ],
)

logical_operations_table = TableMaker.ComparisonTable(
    "## Logical Operations",
    (p="Python", j="Julia", n="Note"),
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"),
    [
        (p="a and b", j="a && b", n="short-circuiting logical AND operator"),
        (p="a or b", j="a || b", n="short-circuiting logical OR operator"),
        (p="np.logical_and(a, b)", j="a .&& b ", n="element-by-element AND operator"),
        (p="np.logical_or(a, b)", j="a .|| b", n="element-by-element OR operator"),
        (p="a & b", j="a & b", n="bitwise AND operator"),
        (p="a | b", j="a | b", n="bitwise OR operator"),
    ],
)

tensor_create_table = TableMaker.ComparisonTable(
    "## Creating vectors, matrices and tensors (w.i.p.)",
    (p="Python", j="Julia", n="Note"),
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"),
    [
        (
        p="""
        np.array([
            [1., 2., 3.], 
            [4., 5., 6.]
        ])
        """, 
        j="""[
                [1 2 3];
                [4 5 6]
            ]""", 
        n="""
        define a 2x3 2D array
        """
        ),
        (
            p="np.zeros((3, 4))",
            j="zeros(3, 4)",
            n="3x4 two-dimensional array full of 64-bit floating point zeros",
        ),
        (
            p="np.ones((3, 4))",
            j="ones(3, 4)",
            n="3x4 two-dimensional array full of 64-bit floating point ones",
        ),
        (p="""
        np.eye(3)
        """, 
        j="""
            UniformScaling(1)  # or
            LA.I  # from LinearAlgebra
            """, 
        n="""
        3x3 identity matrix.
        """),
        (
        p="""
        np.block([
            [a, b],
            [c, d]
        ])""", 
        j="""[
            [a b];
            [c d]
        ]""", 
        n="""construct a matrix from blocks a, b, c, and d
        """
        ),
        (p="np.diag(v, 0)", j="Diagonal(a)  # or\ndiagm(a)", n="Construct a diagonal matrix from vector `v`"),
        (
            p="""
            from numpy.random \\
                import default_rng

            rng = default_rng(42)
            rng.random(3, 4)
            """,
            j="""
            using Random
            
            rng = Xoshiro(42)
            rand(Float64, (3, 4)) 
            """,
            n="""
            generate a random 3x4 array with default random number generator and seed = 42
            """,
        ),
        (
            p="""
            np.linspace(1, 3, 4)
            """,
            j="""
            range(1, 3, length=4)
            """,
            n="""
            4 equally spaced samples between 1 and 3, inclusive
            """,
        ),
        (p="np.tile(a, (m, n))", j="repeat(a, m, n)", n="create m by n copies of a"),
        (
            p="""
            np.hstack((a, b))  # or
            np.concatenate((a, b), 1)
            """, 
            j="""
            hcat(a, b)  # or
            [a b]  # or
            cat(a, b; dims=2)
            """, 
            n="""
            concatenate columns of a and b
            """
        ),
        (
            p="""
            np.hstack((a, b, ...))  # or
            np.concatenate((a, b, ...), 1)
            """, 
            j="""
            reduce(hcat, [a, b, ...]) 
            """, 
            n="""
            concatenate columns of many arrays
            In Julia, "reduce(hcat, [a, b, ...])" calls a more efficient method for concatenating many arrays.
            """
        ),
        (
            p="""
            np.vstack((a, b))  # or
            np.concatenate((a, b))
            """, 
            j="""
            vcat(a, b)  # or
            [a; b]  # or
            cat(a, b;, dims=1)
            """, 
            n="""
            concatenate rows of a and b"""
        ),
        (
            p="""
            np.vstack((a, b, ...))  # or
            np.concatenate((a, b, ...), 1)
            """, 
            j="""
            reduce(vcat, [a, b, ...]) 
            """, 
            n="""
            concatenate rows of many arrays
            In Julia, "reduce(vcat, [a, b, ...])" calls a more efficient method for concatenating many arrays.
            """
        ),
        (p="np.arange(1., 11.)", j="1:10", n="create an increasing vector"),
        (p="np.arange(10.)", j="0:10", n="create an increasing vector"),
        (p="np.arange(1., 11.) \\\n    [:, np.newaxis]", j="1:10", n="create a column vector"),
        (p="np.arange(1., 11.)", j="(1:10)’", n="create a row vector"),
        (
            p="y = x.flatten()",
            j="x[:]",
            n="turn array into vector, note that Julia uses column-major order",
        ),
        (
            p="""
           np.mgrid[0:9., 0:6.]
           """,
            j="""
            using LazyGrids
            
            ndgrid(0:8, 0:5)
            """,
            n="""
            two 2D arrays: one of x values, the other of y values
            """,
        ),
        (
            p="""
            np.meshgrid(
                [1, 2, 4], 
                [2, 4, 5]
            )
            """, j="""
            using LazyGrids: ndgrid
             
            ndgrid([1, 2, 4], [2, 4, 5])
            """, 
            n="""
            Create a meshgrid      
            """
        ),
    ],
)

indexing_table = TableMaker.ComparisonTable(
    "## Indexing vectors, matrices and tensors (w.i.p.)",
    (p="Python", j="Julia", n="Note"),
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"),
    [
        (p="np.size(a)  # or\na.size", j="length(a)", n="number of elements of array a"),
        (p="np.shape(a)  # or\na.shzpe", j="size(a)", n="“size” of array a"),
        (
            p="a.shape[n-1]",
            j="size(a, n)",
            n="get the number of elements of the n-th dimension of array a.",
        ),
        (p="a[-1]", j="a[end]", n="access last element in 1D array a"),
        (p="a[0]", j="a[1]  # or\na[begin]", n="access first element in 1D array a[^2]"),
        (
            p="a[1, 4]",
            j="a[2, 5]",
            n="access element in second row, fifth column in 2D array a",
        ),
        (p="a[1]  # or\na[1, :]", j="a[2, :]", n="entire second row of 2D array a"),
        (
            p="a[0:5]  # or\na[:5]  # or\na[0:5, :]",
            j="a[1:5, :]",
            n="first 5 rows of 2D array a",
        ),
        (p="a[-5:]", j="a[end-4:end, :]", n="last 5 rows of 2D array a"),
        (
            p="a[0:3, 4:9]",
            j="a[1:3, 5:9]",
            n="The first through third rows and fifth through ninth columns of a 2D array, a.",
        ),
        (
            p="a[2:21:2, :]",
            j="a[3:2:21, :]",
            n="every other row of a, starting with the third and going to the twenty-first",
        ),
        (
            p="a[::2, :]",
            j="a[:2:end, :]",
            n="every other row of a, starting with the first",
        ),
        (p="a[::-1, :]", j="a[end:-1:1, :]", n="a with rows in reverse order"),
        (p="(a > 0.5)", j="a .> 0.5", n="matrix whose i,jth element is (a_ij > 0.5)."),
        (
            p="np.nonzero(a > 0.5)",
            j="findall(ax .> 0.5)",
            n="find the indices where (a > 0.5)",
        ),
        (
            p="a[:, v > 0.5]",
            j="a[:, v .> 0.5]",
            n="extract the columns of a where vector v > 0.5",
        ),
        (
            p="a[:, v.T > 0.5]",
            j="a[:, v .> 0.5] ",
            n="extract the columns of a where column vector v > 0.5",
        ),
        (
            p="a[a < 0.5] = 0",
            j="a[a .< 0.5] .= 0",
            n="a with elements less than 0.5 zeroed out",
        ),
        (
            p="a * (a > 0.5)",
            j="a .* (a .> 0.5)",
            n="a with elements less than 0.5 zeroed out",
        ),
    ],
)

linear_algebra_table = TableMaker.ComparisonTable(
    "## Linear Algebra",
    (p="Python", j="Julia", n="Note"),
    (p="```python\n{}\n```", j="```julia\n{}\n```", n="{}"),
    [
        (
            p="from numpy \\\n    import random\nfrom numpy \\\n    import linalg as la",
            j="import Random\nimport LinearAlgebra as LA",
            n="imports that are used for this table[^1]",
        ),
        (p="a.transpose()  # or\na.T", j="transpose(a)", n="transpose of a"),
        (p="a.conj().T  # or\na.conj().transpose()", j="a’", n="conjugate transpose of a"),
        (p="a @ b", j="a * b", n="matrix multiply"),
        (p="a * b", j="a .* b", n="element-wise multiply"),
        (p="a / b", j="a ./ b", n="element-wise divide"),
        (p="a ** 3", j="a.^3", n="element-wise exponentiation "),
        (p="la.matrixpower(a, 3)", j="a^3", n="matrix exponentiation "),
        (p="a[:] = 3", j="a .= 3", n="set all values to the same scalar value"),
        (p="y = x.copy()", j="y = copy(x)", n="Get copy"),
        (
            p="y = x[1, :].copy()",
            j="y = x[1, :]",
            n="numpy slices are by reference, Julia slices are by copy",
        ),
        (
            p="y = x[1, :]",
            j="@view y = x[1, :]",
            n="@view macro changes slices into views (references)",
        ),
        (p="np.diag(a)", j="diag(a)", n="Extract the diagonal from matrix `a`"),
        (p="a.max()", j="maximum(a)", n=""),
        (
            p="""
            np.nanmax(a)
            """,
            j="""
            maximum(filter(!isnan, a))
            """,
            n="""
            maximum element of a, ignoring NaN.
            Note that the second Julia option does not allocate an intermediate array.
            """,
        ),
        (
            p="a.max(0)",
            j="maximum(a;, dims=1)",
            n="maximum element of each column of array a",
        ),
        (p="a.max(1)", j="maximum(a;, dims=2)", n="maximum element of each row of array a"),
        (
            p="np.maximum(a, b)",
            j="max.(a, b)",
            n="compares a and b element-wise, and returns the maximum value from each pair",
        ),
        (
            p="""
            np.sqrt(v @ v)  # or
            la.norm(v)
            """, 
            j="""
            LA.norm(v)
            """, 
            n="""
            L2 norm of vector v
            """
        ),
        (p="la.inv(a)", j="inv(a)", n="inverse of square 2D array a"),
        (
            p="""
            la.pinv(a)
            """, 
            j="""
            LA.pinv(v)
            """, 
            n="""
            pseudo-inverse of 2D array a
            """
        ),
        (
            p="""
            la.matrix_rank(a)
            """, 
            j="""
            LA.rank(v)
            """, 
            n="""
            matrix rank of a 2D array a
            """),
        (
            p="""
            la.solve(a, b)  # if square
            la.lstsq(a, b)  # otherwise
            """, 
            j="""
            a \\ b
            """, 
            n="""
            solution of a x = b for x
            """),
        (
            p="""
            U, S, Vh = la.svd(a);
            V = Vh.T
            """, 
            j="""
            F = LA.svd(a)
            U, S, V = F;  # or
            Uonly, = LA.svd(a)
            """, 
            n="""
            singular value decomposition of a
            """),
        (
            p="""
            la.cholesky(a)
            """, 
            j="""
            LA.cholesky(a)
            """, 
            n="""
            Cholesky factorization of a 2D array
            """),
        (
            p="""
            D, V = la.eig(a)
            """,
            j="""
            F = LA.eigen(a)
            vals, vecs = F;
            """,
            n="""
            Eigenvalues λ and eigenvectors v of a, where av=λv
            """,
        ),
        (
            p="""
            D, V = la.eig(a, b)
            """,
            j="""
            F = LA.eigen(a, b)
            vals, vecs = F;
            """,
            n="""
            Eigenvalues λ and eigenvectors v of a, b; where av=λbv
            """,
        ),
        (
            p="""
            D, V = eigs(a; k=3)
            """,
            j="""
            F = LA.eigen(a, end-2:rank(x))
            vals, vecs = F;
            """,
            n="""
            find the k=3 largest eigenvalues and eigenvectors of 2D array a.
            The julia version only works for `a` of specific type.
            """,
        ),
    ],
)

prologue = "# Equivalents in Julia for common statemtents"
epilogue = replace(
    """
[^1]: These imports are used here in this way for two reasons: ^
(i) to allow short statements in the table and ^
(ii) to be explicit about the source of the methods imported. ^
In proper code, neither the `la` in Python nor the `LA` in Julia would be advised. ^
For Julia, the `LinearAlgebra` would be more typically imported with a `using` statement, ^
perhaps _without_ specifiying the specific items. See <section thereon>

[^2]: The _concrete_ `Vector`, `Matrix` and `Array` types in Julia use the index `1` to indicate the first element. ^
This is, however, an implementation detail for these types. ^
Other types that derive from the _abstract_ types `AbstractVector`, `AbstractMatrix` or `AbstractArray` ^
may index their data differently. ^
Most notably, Julia implements an `OffsetArray` type, that allows arrays indexed from any datum. ^
When defining functions to use with an abstract array type, as is recommended for composability, ^
it is vital _not to assume anything about the indexing_ of the concrete structs.
See <good link>
""",
    "^\n" => "",
)

TableMaker.make_markdown(
    [
        prologue,
        general_purpose_table,
        logical_operations_table,
        tensor_create_table,
        indexing_table,
        linear_algebra_table,
        epilogue,
    ],
    joinpath("docs", "src", "julia_for_numpy_users.md"),
)