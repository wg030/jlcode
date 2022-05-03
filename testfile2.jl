# KNOWN MANAGEABLE ISSUES:

# numbers in E-notation without using a + sign:
evar = 3.99e400
evar₂ = 3.99E400


# single characters
mychar = 'W'
mychar⁽²⁾ = '€'
mychar⁽³⁾ = 'ϰ'


# calling self defined macros
@spellcheck("fukc")


# self defined functions ending with '!'
function changesig!( A)
    A .= -A
end




# KNOWN MANAGEABLE ISSUES (pdftex ENGINE ONLY):

# identifier name with a number that follows
# directly behind a special unicode character:
myβ2ndvar = 2 * 0.12E-2 * xʸ


# identifier name, which contains a γ, π or φ:
myφvar₊ = sqrt(2)
approx4π = 3.142
