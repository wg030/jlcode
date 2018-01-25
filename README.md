# jlcode.sty
  
  
  
## Short Package Description
The _jlcode.sty_ is a latex package, which contains a Julia language definition for the listings package.  
To make use of it, copy the _jlcode.sty_ file to same folder of your latex file and add the following line to your latex document header:

    \usepackage{jlcode}
  
  
## Current State
The **current version** of this file is **1.0**.  
### Keywords
All keywords, literals and built-ins for this language definition were taken from the file [https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js](https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js).
### Colors
All colors for this language definition were taken from [https://docs.julialang.org/en/stable/assets/highlightjs/default.css](https://docs.julialang.org/en/stable/assets/highlightjs/default.css) and [https://docs.julialang.org/en/stable/assets/documenter.css](https://docs.julialang.org/en/stable/assets/documenter.css).  
### No Support for Special Unicode Characters Yet
Right now your Julia code will create an error when compling your latex document if it contains Unicode points greater than 00A0. So your variable and function names should just consist of letters, numbers and the underscore.
  
  
## Feel Free to Contribute
Please feel free to contribute and report bugs!
