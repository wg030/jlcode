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
**Current version** of the jlcode package: **2.0**.  
Date of creation: 2018/01/25  
Date of last modification: 2018/03/05  

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

  
## Feel Free to Contribute
Please feel free to contribute and report bugs!  
It would be especially appreciated if you helped me adding support for more
special unicode characters. 
