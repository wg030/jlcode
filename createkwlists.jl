#clearconsole()
cd( dirname( @__FILE__()))



using DataStructures: SortedSet
using REPL.REPLCompletions



modulelist = [
# Core modules
"Core","Core.Compiler", "Core.IR", "Core.Intrinsics",

# Base modules
"Base", "Base.Broadcast", "Base.Docs", "Base.GC", "Base.Iterators", "Base.Libc",
"Base.MathConstants", "Base.Meta", "Base.StackTraces", "Base.Sys",
"Base.Threads",

# modules of the Standard Library
"Artifacts", "Base64", "CRC32c", "Dates", "DelimitedFiles", "Distributed",
"FileWatching", "Downloads", #"Future",
"InteractiveUtils", "LazyArtifacts", "LibGit2", "Libdl", "LinearAlgebra",
"Logging", "Markdown", "Mmap", "Pkg", "Printf", "Profile", "REPL", "Random",
"SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays",
"SuiteSparse", "Statistics", "SuiteSparse", "TOML", "Test", "UUIDs", "Unicode"
]

keywords, literals = SortedSet{String}(), SortedSet{String}()
builtins, macros = SortedSet{String}(), SortedSet{String}()
functions, functions! = SortedSet{String}(), SortedSet{String}()
vurest, allmod = SortedSet{String}(), SortedSet{String}()
strprefixes = SortedSet{String}()




# keywords
for kw in REPLCompletions.sorted_keywords
    push!( keywords, kw)
end
union!(keywords, ["in", "isa", "where"])



# literals, built-ins, macros
for modstr ∈ modulelist
    eval( Meta.parse( string( "using ", modstr))) # loading current module

    for nsymb in names( eval( Meta.parse(modstr)), all=false)
        #try
        nstr = string( nsymb)
        neval = eval( nsymb)
        push!( allmod, nstr)

        # literals
        if !(neval isa Function || neval isa Type || neval isa Module)
            push!( literals, nstr)
        # built-ins
        elseif neval isa Type
            push!( builtins, nstr)
        # macros
        elseif neval isa Function && nstr[1] == '@'
            push!( macros, nstr)
        # functions
        elseif neval isa Function
            push!( functions, nstr)
            if nstr[end] == '!'
                push!( functions!, nstr)
            end
        # very unimportant rest
        else
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

# remove operators from the functions list
oplist = ["=>", "!", "!=", "!==", "%", "&", "'", "*", "+", "-", "/", "//", ":",
"<", "<:", "<<", "<=", "==", "===", ">", ">:", ">=", ">>", ">>>", "\\", "^",
"|", "|>", "~", "×", "÷", "∈", "∉", "∋", "∌", "∘", "√", "∛", "∩", "∪", "≈", "≉",
"≠", "≡", "≢", "≤", "≥", "⊆", "⊇", "⊈", "⊉", "⊊", "⊋", "⊻", "⋅"]
setdiff!( builtins, oplist)
setdiff!( functions, oplist)
setdiff!( functions!, oplist)
union!( vurest, oplist)



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





function PrintList( list, listname)

    println( listname * ":")
    curlength = 0
    for el ∈ list
        if curlength + length(el) + 1 ≥ 80
            print("%\n")
            curlength = 0
        end
        print( el, ",")
        curlength = curlength + length( el) + 1
    end
    println( "\n")

end


function PrintLiterates( list)

    println( "julia's functions ending with '!'")
    curlength = 0
    for el ∈ list
        mod_el = "{$(el)}{{\\funcc{$(el)}}}{$(length(el))}"
        if curlength + length(mod_el) > 80
            print("\n")
            curlength = 0
        end
        print( mod_el, " ")
        curlength = curlength + length( mod_el) + 1
    end
    println( "\n")

end




# printing all lists
PrintList( keywords, "KEYWORDS")
PrintList( literals, "LITERALS")
PrintList( builtins, "BUILT-INS")
PrintList( macros, "MACROS")
PrintList( functions, "FUNCTIONS")
PrintList( strprefixes, "STRING PREFIXES")
PrintList( vurest, "VERY UNIMPORTANT REST")
PrintLiterates( functions!)
