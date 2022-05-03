# jlcode.sty



## License
_jlcode.sty_
Copyright 2018 Willi Gerbig

This work may be distributed and/or modified under the conditions of the LaTeX Project  
Public License, either version 1.3 of this license or (at your option) any later version.  
The latest version of this license is in [http://www.latex-project.org/lppl.txt](http://www.latex-project.org/lppl.txt)  
and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.

This work has the LPPL maintenance status 'maintained'.

The Current Maintainer of this work is Willi Gerbig.

This work consists of the files  
_jlcode.sty_, _createkwlists.jl_, _createucclist.jl_, _testfile.jl_,  
_testfile2.jl_ and _manual.pdf_.


## Short Package Description
The _jlcode.sty_ is a latex package, which contains a Julia language definition  
for the listings package as well as a style definitions with different themes.  
Since version 6.0 it cannot only be used with pdftex, but also with luatex and xetex.  
Check out the manual (_manual.pdf_), which explains all package options and   
also shows how the Julia code from _testfile.jl_ and _testfile2.jl_ looks when displayed.


## Current State
**Current version** of the jlcode package: **6.1**.  
Date of creation: 2018/01/25  
Date of last modification: 2022/05/03

### Keywords
The lists for the keywords, literals, built-ins, macros, functions and string types for  
this language definition were created with the julia script _createkwlists.jl_, which  
was strongly inspired by the approach of the following script:  
[https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js](https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js).

### Colors
All colors for the default theme of this package were taken from the file  
[https://docs.julialang.org/en/v1/assets/themes/documenter-light.css](https://docs.julialang.org/en/v1/assets/themes/documenter-light.css)  
and  all colors for the darkbeamer theme of this package were taken from the file  
[https://github.com/dietercastel/jlcode/blob/darktheme/jlcode.sty](https://github.com/dietercastel/jlcode/blob/darktheme/jlcode.sty), which  
contains a contribution from "dietercastel" who put toegther this great theme,  
which is designed to be ideally suited for the dark-beamer-theme.  

### Special Unicode Characters
All tab completion Unicode characters supported by Julia can be found under  
[https://docs.julialang.org/en/v1.7/manual/unicode-input/](https://docs.julialang.org/en/v1.7/manual/unicode-input/).  
When dealing with the luatex or xetex engine the jlcode package will by default  
work with the JuliaMono font, whose latest version can be found under  
[https://github.com/cormullion/juliamono](https://github.com/cormullion/juliamono).  
This JuliaMono font approach was inspired by the following repository:  
[https://github.com/mossr/julia-mono-listings](https://github.com/mossr/julia-mono-listings).

At the moment the jlcode package supports the follwoing Unicode characters,  
when you compile your document with luatex or xetex:
* Most common special characters that appear in latin languages.
* All tab completion Unicode characters that the JuliaMono font supports.
* Most of the characters which are used for drawing unicode boxes.

At the moment the jlcode package supports the follwoing Unicode characters,  
when you compile your document with pdftex:
* Most common special characters that appear in latin languages.
* All greek small and capital letters.
* All latin and greek letters with dot, double dot, tilde, hat or bar above.
* All latin double-struck, script and fraktur capital letters.
* All superscripts and subscripts (except for the latin small letter schwa).
* Quite a few mathematical operators and symbols.
* Most of the characters which are used for drawing unicode boxes.


## What's New in Version 6.1?
* A separate license file has been added.
* All standard functions ending with `!` are now colored correctly.
* The commands `\addlitjlmacros` and `\addlitjlfunctions` for manual  
  fixing manageable issues with macros and functions have been added.
* The listings key `breaklines=true` is now used automatically by default.
* Keywords, literals, built-ins, macros, functions and string-prefixes  
  have been refreshed according to Julia 1.7.2.
* A few typing errors have been corrected.


## How to Use the Package:

### Standard Use
Copy the _jlcode.sty_ file to the same folder like your latex file.  
Addionally, if you want to use luatex or xetex for compiling your  
document, also put all _JuliaMono-*.ttf_ files to the same folder  
like your latex file.  
Then add the following line to your latex document header,  
which will load the package with its default options:

```latex
\usepackage{jlcode}
```

After doing so you can use the package as follows:

```latex
% listing of standalone files
\jlinputlisting{filename.jl}

% displayed code
\begin{jllisting}
# some julia code
println( "Here we go with Julia!")
\end{jllisting}

% code snippets
Julia's standard library contains some useful macros like \jlinl{@time}.
```

### Advanced Use
Check out the manual to learn more about the package options and  
some advanced techniques like handling manageable issues.


## Feel Free to Contribute
Please feel free to contribute and report bugs!  

It would be especially appreciated if you helped me  
adding support for more special unicode characters.
