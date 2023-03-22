function make_table(filepath::AbstractString)
    lines = readlines(filepath; keep=true)
    replaced = replace.(lines, "&lt;" => "<", "&gt;" => ">", "&quot;" => "\"")
    open(filepath, "w") do out_file
        print.(out_file, replaced)
    end
end