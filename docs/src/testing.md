## Testing

### ReTest
Use  the `ReTest` package to allow developers to easily re-execute specific tests. 
The `ReTest` package works best by defining a dedicated Test module, which is included in the `runtests.jl`.

The code should look something like the following:
````julia
# Slotting/test/runtests.jl
using ReTest
using Slotting

include("TestSlotting.jl")

# when including this file (e.g. with `Pkg.test`), all the tests
# in both modules will be run:

retest(Slotting, TestSlotting)
````

````julia
# Slotting/src/TestSlotting.jl
module TestSlotting

using ReTest
using StatsBase

using Slotting

include("common.jl")
testdata = SlottingTestData(base_path=joinpath(pkgdir(Slotting), "test"), config_file="config_test.yaml")

include("test_model.jl")
include("test_reconstruct.jl")
end
````

Note that you can conviently execute the `runtests.jl` file line-by-line in your REPL (e.g. using `Shift+Enter` in VSCode).
This does require having any packages defined in `test/Project.toml` in your base environment.
In many cases, this is restricted to `ReTest` itself and maybe some packages in Base

### Common data
Make sure that any data that is common to multiple tests is defined in the Test module, _not_ in an included file.
This ensures a clear dependency pattern allowing readers of the (test) code to easily find the definition of variables used in the tests.
The _functions_, e.g. the `SlottingTestData` constructor, that are used when loading the common data _should_ be placed in included files.


### Tests structure
The structure of tests should mirror the structure of the code base.
In the example above, the files `test/test_model.jl` and `test/test_reconstruct.jl` mirror files `src/model.jl` and `src/reconstruct.jl`. 
It cannot be stressed enough that all these tests should be independent! 