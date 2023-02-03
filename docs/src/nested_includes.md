
## Nested includes
If your package consists of many files being included, it is possibly a good idea to create some ordering in the included files. 
Please note, however, that this is also a good moment to reconsider the scope of the package!
If you are convinced that the package scope is OK, but a folder structure makes sense, please follow these guidelines.

### Proposal 1
- At the top-level `src/MyPackage.jl` maintains the same structure as before.
- Gather all sub-includes in one file within the subdirectory that is obviously the top-level.

The resulting file structure should look something like
```
|-- src/
|    |-- bigstuff/
|    |    |-- bigstuff.jl
|    |    |-- fileio.jl
|    |    |-- methods.jl
|    |    |-- types.jl
|    |-- MyPackage.jl
|    |-- smallstuff.jl
|    |-- tinystuff.jl
```
The inclusion of the code in the folder `bigstuff` is done entirely by `bigstuff/bigstuff.jl` and that is _all_ it does.

````julia
# MyPackage/src/bigstuff/bigstuff.jl
include("bigstuff/types.jl")
include("bigstuff/methods.jl")
include("bigstuff/read.jl")
# note that the export statements remain at the top-level in MyPackage.jl
````

### Proposal 2
- At the top-level `src/MyPackage.jl` maintains a similar structure to before, just with more includes.

The resulting file structure should look something like
```
|-- src/
|    |-- bigstuff/
|    |    |-- fileio.jl
|    |    |-- methods.jl
|    |    |-- types.jl
|    |-- MyPackage.jl
|    |-- smallstuff.jl
|    |-- tinystuff.jl
```
The inclusion of the code in the folder `bigstuff` is done by a set of visually grouped inclues in `MyPackage.jl`.

````julia
# MyPackage/src/MyPackage.jl
module MyPackage  

include("smallstuff.jl")
export SmallType, smallmethod

include("tinystuff.jl")
export TinyType, tinymethod

include("bigstuff/types.jl")
export BigType, EnormousType, HugeType
include("bigstuff/methods.jl")
export do_big_stuff
include("bigstuff/read.jl")
export read, write

end # module
````

### Rule of thumb
Any file should either
1. Contain no `include` calls
2. Be a module consisting only of `using`, `import`, `export` statements and `include` calls
3. A module small enough to not need any `include` calls at all.