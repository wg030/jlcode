#clearconsole()


using DataStructures: SortedSet
using REPL.REPLCompletions



modulelist = [
"Core","Core.Compiler", "Core.IR", "Core.Intrinsics",
"Base", "Base.Broadcast", "Base.Docs", "Base.GC", "Base.Iterators", "Base.Libc",
"Base.MathConstants", "Base.Meta", "Base.StackTraces", "Base.Sys",
"Base.Threads",
"Base64", "CRC32c", "Dates", "DelimitedFiles", "Distributed", "FileWatching",
#"Future",
"InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Logging", "Markdown",
"Mmap", "Printf", "Profile", "REPL", "Random", "SHA", "Serialization",
"SharedArrays", "Sockets", "SparseArrays", "SuiteSparse", "Test", "UUIDs",
"Unicode"
]

keywords, literals = SortedSet{String}(), SortedSet{String}()
builtins, macros = SortedSet{String}(), SortedSet{String}()
vurest, strprefixes = SortedSet{String}(), SortedSet{String}()
allmod, allmod2 = SortedSet{String}(), SortedSet{String}()



# keywords # 36
for kw in REPLCompletions.sorted_keywords
    push!( keywords, kw)
end
union!(keywords, ["in", "isa", "where"])



# literals, built-ins, macros
for modstr ∈ modulelist
    eval( Meta.parse( string( "using ", modstr))) # loading module

    for nsymb in names( eval( Meta.parse(modstr)), all=false)
        #try
        nstr = string( nsymb)
        neval = eval( nsymb)
        push!( allmod2, nstr)

        # literals # 37
        if !(neval isa Function || neval isa Type || neval isa Module)
            push!( literals, nstr)
        # built-ins # 187
        elseif neval isa Type
            push!( builtins, nstr)
        # macros # 57
        elseif neval isa Function && nstr[1] == '@'
            push!( macros, nstr)
        # very unimportant rest # 699
        else#if neval isa Module
            push!( vurest, nstr)
        end
        #catch
        #end
    end
end

# true and false are supposed to be displayed
# like literals and not keywords
setdiff!( keywords, ["true", "false"])
union!( literals, ["true", "false"])



# string prefixes
replc = REPLCompletions.completions("", 0)[1]
for name ∈ replc
    #try
    if name isa REPLCompletions.ModuleCompletion
        m = name.mod
        if occursin( "\"", m)
            push!( strprefixes, m)
        end
    end
    #catch
    #end
end





println( "KEYWORDS:")
for kw ∈ keywords
    print( kw, ",")
end
println( "\n")
println( "LITERALS:")
for l ∈ literals
    print( l, ",")
end
println( "\n")
println( "BUILT-INS")
for bi ∈ builtins
    print( bi, ",")
end
println( "\n")
println( "MACROS:")
for m ∈ macros
    print( m, ",")
end
println( "\n")
println( "VERY UNIMPORTANT REST:")
for r ∈ vurest
    print( r, ",")
end
println( "\n")
println( "STRING PREFIXES:")
for sp ∈ strprefixes
    print( sp, ", ")
end
