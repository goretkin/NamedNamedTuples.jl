import NamedNamedTuples: @NamedNamedTuple
using Test

import Setfield: @set

@testset "NamedNamedTuples.jl" begin
    # Write your tests here.
    @NamedNamedTuple MyType

    mt = MyType((x=3, y="hey"))
    @test mt.x == 3
    @test mt.y == "hey"
    @test_throws ErrorException mt.z

    mt2 = @set mt.x = 7
    @test mt2.x == 7
    @test mt2.y == "hey"

    # allow field type to change
    mt3 = @set mt.x = "seven"
    @test mt3.x == "seven"
    @test mt3.y == "hey"

    @test_throws MethodError mt.x = 3
    @test_throws ErrorException mt.x = (x=1, y="one")
    @test_throws ErrorException mt.y = "hey"
end
