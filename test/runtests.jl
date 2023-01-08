include("../src/Tenniskata.jl")
include("../src/Tenniskata1.jl")
include("../src/Tenniskata2.jl")
include("../src/Tenniskata3.jl")

using Test

struct TestData
	Player1Point::Int
	Player2Point::Int
	Score::String
end

AllTestCase = [
	TestData(0, 0, "Love-All");
	TestData(1, 0, "Fifteen-Love");
	TestData(2, 0, "Thirty-Love");
	TestData(3, 0, "Forty-Love");
	TestData(4, 0, "Win for player1");
]

function create_playing_game_for_Tenniskata1(player1_won_count::Int, player2_won_count::Int)::TennisGame1
	game = TennisGame1("", "") # names are not used
	for _ in range(; length = player1_won_count) 
		Tenniskata.won_point(game, "player1")
	end
	for _ in range(; length = player2_won_count) 
		Tenniskata.won_point(game, "player2")
	end
	return game
end

@testset "Tenniskata1_Test" begin
	for c in AllTestCase
		g = create_playing_game_for_Tenniskata1(c.Player1Point, c.Player2Point)
		@test Tenniskata.get_score(g) == c.Score
	end
end
