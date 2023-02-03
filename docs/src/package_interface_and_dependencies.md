
## Package interface and dependencies
Anyone approaching a package should have an easy time understanding interface(s) and dependencies of the package. 
In Julia, the interface(s) that a package promises to provide are determined by `export` statements. 
Note that other (abstract) types, (concrete) structures and methods are also available to users, but a package does not promise stability for these. 
The dependencies of a package are defined by its `using` and `import` statements. 

All `using`, `import` and `export` statements belong in the main module file, `src/MyModule.jl`.
Preferrably explicitly mention types, structures and methods that are being brought into scope by `using` or `import`. 
Make a separation between external and internal packages. 
To further help readers, place `export` statements adjacent to the `include` calls that define that which is exported. 
Order the exported items in a sensible and consistent manner, e.g. alphabetically with types (capitalized) first.

As an example, consider the following
````julia
# Slotting/src/Slotting.jl
module Slotting  
using DataFrames: DataFrame, combine, groupby
using Statistics: mean, std
using GLMakie

using InternalPackage: something

include("errors.jl")

include("slotting.jl")
export Result, slot

include("slotting_plots.jl")
export plot_items, plot_result

end # module
````