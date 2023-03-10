## Testing

### ReTest
Use  the `ReTest` package to allow developers to easily re-execute specific tests. 
The `ReTest` package works best by defining a dedicated Test module, which is included in the `runtests.jl`.

The code should look something like the following:
````julia
# Slotting/test/runtests.jl
using ReTest
using Slotting

include("SlottingTests.jl")

# when including this file (e.g. with `Pkg.test`), all the tests
# in both modules will be run:

retest(Slotting, SlottingTests)
````

````julia
# Slotting/src/SlottingTests.jl
module SlottingTests

using ReTest
using StatsBase

using Slotting

include("common.jl")

include("test_model.jl")
include("test_reconstruct.jl")
end
````

Note that you can conviently execute the `runtests.jl` file line-by-line in your REPL (e.g. using `Shift+Enter` in VSCode).
This does require having any packages defined in `test/Project.toml` in your base environment.
In many cases, this is restricted to `ReTest` itself and maybe some packages in Base

### Tests structure
The structure of tests should mirror the structure of the code base.
In the example above, the files `test/test_model.jl` and `test/test_reconstruct.jl` mirror files `src/model.jl` and `src/reconstruct.jl`. 
It cannot be stressed enough that all these tests should be independent! 