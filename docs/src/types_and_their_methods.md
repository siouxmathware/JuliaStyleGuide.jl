## Types and Their Methods
Despite Julia not requiring to group data and methods together, it is generally helpful to organized your data and methods similarly to how traditional object-oriented programming works.

````julia
# src/Slotting.jl

include(joinpath("types", "types.jl"))
export AbstractContainer, Crate, Barrel  # exports remain at the top level
````

````julia
# src/types/types.jl
include(joinpath("containers", "containers.jl"))
````

````julia
# src/types/containers/containers.jl
include("AbstractContainer.jl")
include("Crate.jl")
include("Barrel.jl")
````

````julia
# src/types/containers/AbstractContainer.jl
abstract type AbstractContainer end

# interface, _must_ be implemented
height(::C) where {C<:AbstractContainer} = error("Method height not implemented for $C")
width(::C) where {C<:AbstractContainer} = error("Method width not implemented for $C")
depth(::C) where {C<:AbstractContainer} = error("Method depth not implemented for $C")

# shared functionality, _may_ be overwritten
volume(c::AbstractContainer) = height(c) * width(c) * depth(c)
````

And concrete subtypes
````julia
# src/types/containers/Crate.jl
struct Crate <: AbstractContainer
    height::Float64
    width::Float64
    depth::Float64
end

height(c::Crate) = c.height
width(c::Crate) = c.width
depth(c::Crate) = c.depth

volume(c::Crate) = height(c) * width(c) * depth(c)
````
and
````julia
# src/types/containers/Barrel.jl
struct Barrel <: AbstractContainer
    height::Float64
    radius::Float64
end

height(b::Barrel) = b.height
width(b::Barrel) = 2 * b.radius
depth(b::Barrel) = 2 * b.radius

volume(b::Barrel) = b.height * pi * b.radius^2
````