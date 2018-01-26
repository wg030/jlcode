

#= A comment that consits of several lines.
Hence it has to be a little longer, of course.
Otherwise it would be silly as it could fit in one line. =#

# This line will be my reference line, which will exactly contain 80 characters.

# This line is a comment containing operators like &, - and %

# A comment with the German word "Übergrößengeschäft" (store for oversizes)



# defining a useless testfunction
function Style_1st_Test(x, y)

    myver = v"2.00"
    mystr = "A string containing \"Übergrößengeschäft\" and the + operator."
    mychar = 'W'
    z1vec = rand(Int8, 3)
    z2vec = Array{Int8}(3)
    z2vec[1:2] = [x % y, y \ x]
    t = x % 2 == 0 ? x : x + 1
    t = ~(t & x | y)
    z2vec[3] = y^2 + 3.4x*y - t/2
    z2vec = (z2vec + z1vec).^2
    if !(norm(z1vec) < norm(z2vec) + e)
        mystr = String( mystr, " signed ", mychar)
        println( mystr)
        return true;
    elseif norm(z2vec - z1vec) > 2.69
        println( String( "Error in ", myver, "!"))
        return false;
    end

end
