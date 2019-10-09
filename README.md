# jlcode.sty



## License
_jlcode.sty_  
Copyright 2018 GitHub user wg030  

This work may be distributed and/or modified under the conditions of the LaTeX Project  
Public License, either version 1.3 of this license or (at your option) any later version.  
The latest version of this license is in [http://www.latex-project.org/lppl.txt](http://www.latex-project.org/lppl.txt)  
and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.  

This work has the LPPL maintenance status 'maintained'.  

The Current Maintainer of this work is GitHub user wg030.  

This work consists of the files _jlcode.sty_, _testfile1.jl_,  
_testfile2.jl_, _example.tex_ and the derived file _example.pdf_.


## Short Package Description
The _jlcode.sty_ is a latex package, which contains a Julia language definition
for the listings package.  
To make use of it, copy the _jlcode.sty_ file to same folder of your latex file
and add the following line to your latex document header:

    \usepackage{jlcode}

Check out the latex example _example.tex_, which imports some Julia code from
_testfile.jl_ and produces the pdf-file _example.pdf_ as output.


## Current State
**Current version** of the jlcode package: **3.1**.  
Date of creation: 2018/01/25  
Date of last modification: 2019/10/09  

### Keywords
All keywords, literals and built-ins for this language definition were taken
from the file  
[https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js](https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js).

### Colors
All colors for this language definition were taken from the files  
[https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css](https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.12.0/styles/default.min.css) and  
[https://docs.julialang.org/en/latest/assets/documenter.css](https://docs.julialang.org/en/latest/assets/documenter.css).  

### Special Unicode Characters
All unicode characters that are supported by Julia can be found under  
[https://docs.julialang.org/en/latest/manual/unicode-input/](https://docs.julialang.org/en/latest/manual/unicode-input/).

Right now the following of them have already been added to jlcode package, too:
* most common special characters that appear in latin languages
* all greek capital letters
* all greek small letters
* all latin and greek letters with dot above
* all latin and greek letters with double dot above
* all latin and greek letters with tilde above
* all latin and greek letters with hat above
* all latin and greek letters with bar above
* all superscripts
* all subscripts (except for the latin small letter schwa)
* some mathematical operators and symbols

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
    * example:

            myβ2ndvar = 2 * 0.12E-2 * xʸ

    * latex command for fixing it:

            \addlitjlbase{myβ2ndvar}{my$\beta$2ndvar}{9}

* identifier name, which contains a γ, π or φ:  
    * example:

            myφvar₊ = sqrt(2)
            approx4π = 3.142

    * latex command for fixing it:

            \addlitjlbase{myφvar₊}{my$\phi$var${\scriptstyle {}_{+}}$}{7}
            \addlitjlbase{approx4π}{approx4$\pi$}{8}

* numbers in E-notation wihtout using a + sign:  
    * example:

            evar = 3.99e400
            evar₂ = 3.99E400

    * latex commands for fixing it:

            \addlitjlstring{e400}{e400}{4}
            \addlitjlstring{E400}{E400}{4}

* single characters:  
    * example:

            mychar = 'W'
            mychar⁽²⁾ = '€'
            mychar⁽³⁾ = 'ϰ'

    * latex commands for fixing it:

            \addlitjlstring{'W'}{\textquotesingle W\textquotesingle}{3}
            \addlitjlstring{'€'}{\textquotesingle \euro\textquotesingle}{3}
            \addlitjlstring{'ϰ'}{\textquotesingle $\varkappa$\textquotesingle}{3}


## Feel Free to Contribute
Please feel free to contribute and report bugs!  
It would be especially appreciated if you helped me adding support for more
special unicode characters.
