include("../src/Tenniskata.jl")
include("../src/Tenniskata1.jl")
include("../src/Tenniskata2.jl")
include("../src/Tenniskata3.jl")

using Test

@testset "Tests for Tenniskata1" begin
	game = TennisGame1("", "") # names are not used 
	Tenniskata.won_point(game, "player1")
	@test Tenniskata.get_score(game) == "Fifteen-Love"
end
