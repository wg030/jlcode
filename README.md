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

This work consists of the files
_jlcode.sty_, _createlists.jl_, _testfile1.jl_, _testfile2.jl_ and _manual.pdf_.


## Short Package Description
The _jlcode.sty_ is a latex package, which contains a Julia language definition  
for the listings package as well as a style definitions with different themes.  
Check out the manual (_manual.pdf_), which explains all package options and   
also shows how the Julia code from _testfile.jl_ and _testfile2.jl_ looks when displayed.


## Current State
**Current version** of the jlcode package: **5.1**.  
Date of creation: 2018/01/25  
Date of last modification: 2020/11/26

### Keywords
The lists for the keywords, literals, built-ins, macros and string types for  
this language definition were created with the julia script _createlists.jl_, which  
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
All unicode characters that are supported by Julia can be found under  
[https://docs.julialang.org/en/v1/manual/unicode-input/](https://docs.julialang.org/en/v1/manual/unicode-input/).

Right now the following of them have already been added to jlcode package, too:
* Most common special characters that appear in latin languages.
* All greek small and capital letters.
* All latin and greek letters with dot, double dot, tilde, hat or bar above.
* All latin double-struck, script and fraktur capital letters.
* All superscripts and subscripts (except for the latin small letter schwa).
* Some mathematical operators and symbols.
* All characters which are used for drawing unicode boxes.


## What's New in Version 5.1?
* The package option `theme` has been added.
* The package option `courierasttdflt` has been renamed to `usecourier`.
* The package options `usecolors`, `usebox`, `nocolors` and `nobox` have  
  been removed for the benefit of the option `theme`.
* Keywords, literals, built-ins, macros and functions have been refreshed  
  according to Julia 1.5.3.
* All latin double-struck, script and fraktur capital letters have
  been added.
* A few more mathematical symbols have been added.
* All characters which are used for drawing unicode boxes have been added.
* The font size now automatically scales with the size of the current
  active font.
* The `\addlitjlstring` command has been renamed to `\addlitjlstrnum`.
* A few typing errors have been corrected.


## How to Use the Package:

### Standard Use
Copy the _jlcode.sty_ file to same folder of your latex file and add the  
following line to your latex document header, which will load the  
package with its default options:

    \usepackage{jlcode}

Then use the package as follows:

    % listing of standalone files
    \jlinputlisting{filename.jl}

    % displayed code
    \begin{jllisting}
    # some julia code
    println( "Here we go with Julia!")
    \end{jllisting}

    % code snippets
    Julia's standard library contains some useful macros like \jlinl{@time}.

### The Option **autoload**
If you have to display not only Julia code with the listings package,  
it is   best to not load the Julia style automatically because otherwise  
your are very   likely to get some unwanted ugly interferences.

    \usepackage[autoload=false]{jlcode}

With that option you can then use the style only when it is really needed:

    % listing of standalone files
    \jlinputlisting[language=julia, style=jlcodestyle]{filename.jl}

    % displayed code
    \begin{jllisting}[language=julia, style=jlcodestyle]
    # some julia code
    println( "Here we go with Julia!")
    \end{jllisting}

    % code snippets
    Julia's standard library contains some useful macros like \jlinl{@time}.

The default behaviour is `autoload=true`.

### The Option **theme**
If you want to highlight your code with some nice colors and/or a nice  
surrounding box, choose one of the following five themes:

    \usepackage[theme=default]{jlcode}
    %\usepackage[theme=default-plain]{jlcode}
    %\usepackage[theme=grayscale]{jlcode}
    %\usepackage[theme=grayscale-plain]{jlcode}
    %\usepackage[theme=darkbeamer]{jlcode}

The default value is `theme=default`.

### The Option **usecourier**
If you want to use Courier as the default typewriter font, set this option  
to true. Note that only the typewriter font will be affected and that this  
is the recommended option.  
If you want to go with another typewriter font for the code, set this option  
to false and make sure yout load the font before loading the jlcode package.

    \usepackage[usecourier=true]{jlcode}
    %\usepackage[usecourier=false]{jlcode}

The default value is `usecourier=true`.

### The Option **charsperline**
If you decide to go with a theme that has a code box, you can control its  
number of   characters per line with this option, i.e. influence the width of  
the box. However make sure your code respects the limit since otherwise  
some of the displayed code will be out of the box.

    \usepackage[charsperline=65]{jlcode}

The default value is `charsperline=80`.

### Known Managable Issues
Since it is rather difficult to handle special unicode characters with the  
listings package, there are some issues that can appear in special cases  
when using the jlcode package.  
Most of them have to do with the fact that the listings package does not  
seem to offer an option, that makes it possible to force a special unicode  
character, for example a small greek beta, to be treated like a normal letter.  
Having said this the command

    \lstdefinelanguage{julia}
    {
      % ...
      alsoletter={β},
      % ...
    }

of the listings package unfortunately causes an error.  
However the problems that can occur due to this circumstance can be repaired  
manually. For that purpose two commands have been implemented in the jlcode  
package. The easiest way to show how they work is giving some examples. So  
here are the known managable issues and how to fix them with the jlcode package:  
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

            \addlitjlstrnum{e400}{e400}{4}
            \addlitjlstrnum{E400}{E400}{4}

* single characters:
    * example:

            mychar = 'W'
            mychar⁽²⁾ = '€'
            mychar⁽³⁾ = 'ϰ'

    * latex commands for fixing it:

            \addlitjlstrnum{'W'}{\textquotesingle W\textquotesingle}{3}
            \addlitjlstrnum{'€'}{\textquotesingle \euro\textquotesingle}{3}
            \addlitjlstrnum{'ϰ'}{\textquotesingle $\varkappa$\textquotesingle}{3}


## Feel Free to Contribute
Please feel free to contribute and report bugs!  

It would be especially appreciated if you helped me  
adding support for more special unicode characters.
