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
# Slotting/test/SlottingTests.jl
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

Define the actual tests using the `@testset` macro. 
Try to follow the "3xA" pattern: Arrange, Act, Assert (a.k.a. Given, When, Then) and the "FIRST" principles: Fast, Isolated, Repeatable, Self-validating, Thorough and Timely.
The content of a test file may look like this, where we also demonstrate the convient use of for loops in testset defintion:

````julia
# Slotting/test/test_reconstruct.jl
module SlottingTests

@testset "Measurements" begin
    @testset "Volume for radius = $radius ($(radius |> typeof))" for radius in [0, 1, 1.0, pi, 1/sqrt(pi)]  # some interesting samples
        # GIVEN a barrel of some dimensions
        height = 1  # we could add a nested loop to test different heights too
        barrel = Barrel(height, radius)  # create the object

        # WHEN computing the volume
        vol = volume(barrel)
        
        # THEN the volume is correct, at least approximately
        @test isapprox(vol, height * pi * radius^2)
    end

    @testset "Width for radius = $radius ($(radius |> typeof))" for radius in [0, 1, 1.0, pi, 1/sqrt(pi)]  # some interesting samples
        # GIVEN a barrel of some dimensions
        height = 1  # we could add a nested loop to test different heights too
        barrel = Barrel(height, radius)  # create the object

        # WHEN computing the volume
        w = Slotting.width(barrel)  # to access a non-exported item, we must specify the Package name
        
        # THEN the width is correct, at least approximately
        @test isapprox(w == 2*radius)
    end
end
end
````
