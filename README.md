# jlcode.sty
  
  
  
## Short Package Description
The _jlcode.sty_ is a latex package, which contains a Julia language definition
for the listings package.  
To make use of it, copy the _jlcode.sty_ file to same folder of your latex file
and add the following line to your latex document header:

    \usepackage{jlcode}
  
  
## Current State
The **current version** of the jlcode package is **1.1**.  
Date of creation: 2018/01/25  
Date of last modification: 2018/01/26  

### Keywords
All keywords, literals and built-ins for this language definition were taken
from the file
[https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js]
(https://github.com/isagalaev/highlight.js/blob/master/src/languages/julia.js).

### Colors
All colors for this language definition were taken from
[https://docs.julialang.org/en/stable/assets/highlightjs/default.css]
(https://docs.julialang.org/en/stable/assets/highlightjs/default.css) and
[https://docs.julialang.org/en/stable/assets/documenter.css]
(https://docs.julialang.org/en/stable/assets/documenter.css).  

### No Support for Special Unicode Characters Yet
Right now your Julia code will create an error when compling your latex document
if it contains Unicode points greater than 00A0. So your variable and function
names should just consist of letters, numbers and the underscore.  
However here is how you could add support for special unicode characters on your
own. But notice that the method presented here will only work nicely if the
unicode characters in your code don't appear in strings or comments. This has to
do with the fact that we have to color them ourselves with the defined color
jlbase. So using this method they will also be colored with jlbase in comments
and strings, which will work, but look ugly. Let's look at the greek letters α
and β for example. Just extend the literate attribute

    \lstset{literate=
    {ä}{{\"a}}{1} {ö}{{\"o}}{1} {ü}{{\"u}}{1}
    {Ä}{{\"A}}{1} {Ö}{{\"O}}{1} {Ü}{{\"U}}{1} {ß}{\ss}{1}}

in the _jlcode.sty_ file to the following definition in order to add support for
them:

    \lstset{literate=
    {ä}{{\"a}}{1} {ö}{{\"o}}{1} {ü}{{\"u}}{1}
    {Ä}{{\"A}}{1} {Ö}{{\"O}}{1} {Ü}{{\"U}}{1} {ß}{\ss}{1}
    {α}{{{\color{jlbase}$\alpha$}}}{1} {β}{{{\color{jlbase}$\alpha$}}}{1}}
  
  
## Feel Free to Contribute
Please feel free to contribute and report bugs!
