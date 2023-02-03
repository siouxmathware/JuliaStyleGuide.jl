# Naming and casing

> "There are only two hard things in Computer Science: cache invalidation and naming things." - Phil Karlton

We will not even attempt to provide a general solution to the problem of naming objects, but do clarify some details.

## Casing
### Functions and methods
Follow the [Blue](https://github.com/invenia/BlueStyle#function-naming) convention: adopt a `snake_case` for function names. 
But: please appreciate that motivation for _Julia's_ advice to simply concatenate the words in function names is because function names should be short!
In particular, the name of the function should not include information that is already evident from the argument types.

### Packages, Types and Structs
Here we follow both the Julia and Blue style to use `CamelCase`, but with the following clarification.
The casing is to be adhered to strictly. 
This means that if one of the constituents of the name is typically written in upper case, it must also be written with only an initial capital. 
E.g.
- XmlWriter.jl
- SqmPlanner.jl
- PlayerId

This might not play well with acronyms, but they are best avoided anyway.

### Struct fields and variable names
Adopt a `snake_case` for struct fields and variable names.
Beware not to add reduntant scoping to field names, e.g. a struct `Car` may have a `color`, but not a `car_color`. 

> "The length of variable names should be proportional to their scope" - Robert C. Martin

This implies single (Greek) letter variables are only acceptable for the smallest of scopes, e.g. in lambda functions or one-liners.
The effort you save yourself on typing is not worth the effort it costs others in reading.

### Files and folders
To avoid all the nasty side-effects of working on different platforms, stick to lowercase file and folder names as much as possible.