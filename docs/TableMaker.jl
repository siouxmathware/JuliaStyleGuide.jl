module TableMaker
struct ComparisonTable{Names,N}
    title::String
    headers::NamedTuple{Names,NTuple{N,String}}
    templates::NamedTuple{Names,NTuple{N,String}}
    rows::Vector{NamedTuple{Names,NTuple{N,String}}}
end

make_markdown(s::AbstractString) = s  # assume anything passed is already valid markdown

function make_markdown(ct::ComparisonTable{Names, N}) where {Names, N}
    colwidthpercentage = round(100/N) |> Int
    tablebegin = """```@raw html
<table style="width:100%">
    <tbody style="width:100%; display: table;">
```"""
    headerrow =
        """```@raw html\n        <tr>""" *
        join(["""\n            <th style="width: $colwidthpercentage%">""" * ct.headers[name] * "</th>" for name in Names], "\n") *
        """\n        </tr>\n```"""
    contentrows = join(make_content.(Ref(ct), ct.rows), "\n")
    tableend = "```@raw html\n    </tbody>\n</table>\n```"
    return join([ct.title, tablebegin, headerrow, contentrows, tableend], "\n\n")
end

function make_content(
    ct::ComparisonTable{Names, N}, row::NamedTuple{Names,NTuple{N,String}}
) where {Names, N}
    row_begin = """```@raw html
        <tr>
            <td>
```"""
    glue = """\n```@raw html
            </td>
            <td>
```
"""
row_body = join([replace(ct.templates[name], "{}" => row[name]) for name in Names], glue)
# row_body = join([ct.templates[name] for name in Names], glue)
    row_end = """```@raw html
            </td>
        </tr>
```"""
    return join([row_begin, row_body, row_end], "\n")
end

function make_markdown(cts::Vector, filepath::AbstractString)
    markdowns = make_markdown.(cts)
    open(filepath, "w") do out_file
        print.(out_file, markdowns)
    end
    return nothing
end
end