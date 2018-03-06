# jlcode.sty
  
  
  
## Short Package Description
The _jlcode.sty_ is a latex package, which contains a Julia language definition
for the listings package.  
To make use of it, copy the _jlcode.sty_ file to same folder of your latex file
and add the following line to your latex document header:

    \usepackage{jlcode}

Check out the latex example _example.tex_, which imports some Julia code from
_testfile.jl_ and produces the pdf-file _example.pdf_ as output.
  
  
## Current State
**Current version** of the jlcode package: **2.1**.  
Date of creation: 2018/01/25  
Date of last modification: 2018/03/06  

### Keywords
All keywords, literals and built-ins for this language definition were taken
from the file  
[https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js](https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js).

### Colors
All colors for this language definition were taken from the files  
[https://docs.julialang.org/en/stable/assets/highlightjs/default.css](https://docs.julialang.org/en/stable/assets/highlightjs/default.css) and  
[https://docs.julialang.org/en/stable/assets/documenter.css](https://docs.julialang.org/en/stable/assets/documenter.css).  

### Special Unicode Characters
All unicode characters that are supported by Julia can be found under  
[https://docs.julialang.org/en/stable/manual/unicode-input/](https://docs.julialang.org/en/stable/manual/unicode-input/).

Right now the following of them have already been added to jlcode package, too:
* most common special characters that appear in latin languages
* all greek capital letters
* all greek small letters
* all superscripts
* all subscripts (except for the latin small letter schwa)

### Known Managable Issues
Since it is rather difficult to handle special unicode characters with the
listings package, there are some issues that can appear in special cases when
using the jlcode package.  
Most of them have to do with the fact that the listings package does not seem to
offer an option, that makes it possible to force a special unicode character,
for example a small greek beta, to be treated like a normal letter. Having said
this the command

    \lstdefinelanguage{julia}
    {
      % ...
      alsoletter={β},
      % ...
    }

of the listings package unfortunately causes an error.  
However the problems that can occur due to this circumstance can be repaired
manually. For that purpose two commands have been implemented in the jlcode
package. The easiest way to show how they work is giving some examples. So here
are the known managable issues and how to fix them with the jlcode package:
(See the provided example files).
* identifier name with a number that follows directly behind a special unicode
character:  
example:

        myβ2ndvar = 2 * 0.12E-2 * xʸ

latex command for fixing it:

        \addlitjlbase{myβ2ndvar}{my$\beta$2ndvar}{9}

* identifier name, which contains a γ, π or φ:  
exmple:

        myφvar₊ = sqrt(2)

latex command for fixing it:

        \addlitjlbase{myφvar₊}{my$\phi$var${\scriptstyle {}_{+}}$}{7}

* numbers in E-notation wihtout using a + sign:  
example:

        evar = 3.99e400
        evar₂ = 3.99E400

latex commands for fixing it:

        \addlitjlstring{e400}{e400}{4}
        \addlitjlstring{E400}{E400}{4}


## Feel Free to Contribute
Please feel free to contribute and report bugs!  
It would be especially appreciated if you helped me adding support for more
special unicode characters. 
