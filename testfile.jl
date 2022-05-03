#= A comment that consists of several lines.
The following code itself is rather useless unless you want
to test how Julia code is displayed by the jlcode package. =#

# This line will be my reference line, which will contain exactly 80 characters.

# This line is a comment containing operators like &, -, $ and %
# A comment with the German word "Übergrößengeschäft" (store for oversizes)
# This line contains some special unicode characters: €, α, γ, w², Δₓ, Ϋ, x̃, ℯ
# A comment with some numbers: 424, 1.23, 0.2E-5, -9.9e+9, 1_001
# Mathematical characters that are Julia functions:
# |, |>, ~, ×, ÷, ∈, ∉, ∋, ∌, ∘, √, ∛, ∩, ∪,
# ≈, ≉, ≠, ≡, ≢, ≤, ≥, ⊆, ⊇, ⊈, ⊉, ⊊, ⊋, ⊻, ⋅
# Other mathematical symbols: ∇, ⊗, ⊕, ‖, …, ⋯, ⋮, ⋱, ⋰

# defining a useless testfunction
function Style_4th_Test(x, y)

    myver = v"2.00"
    mystr = "String: \"Übergrößengeschäft\", α, π, ∪, φ̇  and the + operator."
    myset = Set( [2, 9, 1_200, 2_500, 33])
    x_in_myset = x ∈ myset
    myset⁽²⁾ = myset ∪ Set( [4, 8_000, 12, 33])
    z1vec = rand(Int8, 3)
    z₂vec = Array{Int8}(undef, 3)
    z₂vec[1:2] = [x % y, y \ x]
    reverse!(z1vec)
    t = x % 2 == 0 ? x : x + 1
    t̄ = ~(t & x | y) ⊻ y
    myτ̂var = t̄ & t $ t
    α = @time √0.3
    βᵅ = 3.2e+5^α
    myβvar = ∛0.12E-2 * βᵅ
    z₂vec[3] = y^2 + 3.4x*y - (α + myβvar) * t/2
    z₂vec = (z₂vec + z1vec).^2
    if !(0.1 ≤ norm(z1vec') < norm(z₂vec') + e + ℯ ÷ pi + γ + φ)
        mystr = String( mystr, " signed ")
        println( mystr)
        return true;
    elseif 3.2 ≥ norm(z₂vec - z1vec) > 2.69
        if norm(z₂vec - z1vec) ≠ 3.0
            println( String( "Error in ", myver, "!"))
        end
        return false;
    end

end
