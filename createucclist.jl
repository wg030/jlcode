cd( dirname( @__FILE__()))


using HTTP
using JSON
using Gumbo
using Cascadia





url = "https://docs.julialang.org/en/v1/manual/unicode-input/"

response = HTTP.get( url)
resbody = String( response.body)
htmlcode = parsehtml( resbody)

datatable = eachmatch( sel"table", htmlcode.root)
datarows = eachmatch( sel"tr", datatable[1])
codepointsraw = Set( String[])
for datarow in datarows[2:end]
    rowvalues = eachmatch( sel"td", datarow)
    push!( codepointsraw, rowvalues[1].children[1].text)
end
# deleting combinations like "U+02AC5 + U+00338"
filter!( el -> length( el) == 7, codepointsraw)

# adding codepoints of the missing special characters
# that appear in latin languages
addcodepoints1 = [ "U+000E1", "U+000E9", "U+000ED", "U+000F3", "U+000FA",
"U+000C1", "U+000C9", "U+000CD", "U+000D3", "U+000DA", "U+000E0", "U+000E8",
"U+000EC", "U+000F2", "U+000F9", "U+000C0", "U+000C8", "U+000CC", "U+000D2",
"U+000D9", "U+000E4", "U+000EB", "U+000EF", "U+000F6", "U+000FC", "U+000C4",
"U+000CB", "U+000CF", "U+000D6", "U+000DC", "U+000E2", "U+000EA", "U+000EE",
"U+000F4", "U+000FB", "U+000C2", "U+000CA", "U+000CE", "U+000D4", "U+000DB",
"U+00171", "U+00170", "U+00151", "U+00150", "U+000E7", "U+000C7", "U+000AB",
"U+000BB", "U+000F1", "U+000D1"]
union!( codepointsraw, addcodepoints1)
# adding codepoints of all unicode box characters
addcodepoints2 = [ "U+02500", "U+02501", "U+02502", "U+02503", "U+02504",
"U+02505", "U+02506", "U+02507", "U+02508", "U+02509", "U+0250A", "U+0250B",
"U+0250C", "U+0250D", "U+0250E", "U+0250F", "U+02510", "U+02511", "U+02512",
"U+02513", "U+02514", "U+02515", "U+02516", "U+02517", "U+02518", "U+02519",
"U+0251A", "U+0251B", "U+0251C", "U+0251D", "U+0251E", "U+0251F", "U+02520",
"U+02521", "U+02522", "U+02523", "U+02524", "U+02525", "U+02526", "U+02527",
"U+02528", "U+02529", "U+0252A", "U+0252B", "U+0252C", "U+0252D", "U+0252E",
"U+0252F", "U+02530", "U+02531", "U+02532", "U+02533", "U+02534", "U+02535",
"U+02536", "U+02537", "U+02538", "U+02539", "U+0253A", "U+0253B", "U+0253C",
"U+0253D", "U+0253E", "U+0253F", "U+02540", "U+02541", "U+02542", "U+02543",
"U+02544", "U+02545", "U+02546", "U+02547", "U+02548", "U+02549", "U+0254A",
"U+0254B", "U+0254C", "U+0254D", "U+0254E", "U+0254F", "U+02550", "U+02551",
"U+02552", "U+02553", "U+02554", "U+02555", "U+02556", "U+02557", "U+02558",
"U+02559", "U+0255A", "U+0255B", "U+0255C", "U+0255D", "U+0255E", "U+0255F",
"U+02560", "U+02561", "U+02562", "U+02563", "U+02564", "U+02565", "U+02566",
"U+02567", "U+02568", "U+02569", "U+0256A", "U+0256B", "U+0256C", "U+0256D",
"U+0256E", "U+0256F", "U+02570", "U+02571", "U+02572", "U+02573", "U+02574",
"U+02575", "U+02576", "U+02577", "U+02578", "U+02579", "U+0257A", "U+0257B",
"U+0257C", "U+0257D", "U+0257E", "U+0257F"]
union!( codepointsraw, addcodepoints2)


# sorting all codepoints
cpuint32 = UInt32[]
for cpraw in codepointsraw
    cprawedit = "0x" * lpad( lowercase( cpraw[3:end]), 8, '0')
    push!( cpuint32, parse( UInt32, cprawedit))
end
sort!( cpuint32)


# bringing the codepoints to the right tex format
cpstr = similar( cpuint32, String)
for (i, cp) in enumerate( cpuint32)
    cpedit = string( cp, base=16)
    cpedit = length( cpedit) % 2 == 0 ? cpedit : "0" * cpedit
    cpprefix = repeat( "^^", length( cpedit) ÷ 2)
    cpstr[i] = cpprefix * cpedit
end




lines = String[]
push!( lines, "")
prevlen = 4
for cp in cpstr
    curlen = length( cp)
    if length( lines[end]) + curlen ≥ 80 || curlen > prevlen
        lines[end] = lines[end] * "%\n"
        push!( lines, "")
    end
    lines[end] = lines[end] * cp
    global prevlen = curlen
end
lines[end] = lines[end] * "%\n"
push!( lines, "^^00")

io = open( "unicodechars.txt", "w")
for line in lines
    write( io, line)
end
close( io)
