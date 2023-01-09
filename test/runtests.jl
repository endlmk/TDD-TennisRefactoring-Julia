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
	TestData(0, 1, "Love-Fifteen");
	TestData(0, 2, "Love-Thirty");
	TestData(0, 3, "Love-Forty");
	TestData(0, 4, "Win for player2");
	TestData(1, 1, "Fifteen-All");
	TestData(2, 2, "Thirty-All");
	TestData(3, 3, "Deuce");
	TestData(2, 1, "Thirty-Fifteen");
	TestData(3, 2, "Forty-Thirty");	
	TestData(4, 2, "Win for player1");	
	TestData(4, 3, "Advantage player1");
	TestData(1, 2, "Fifteen-Thirty");
	TestData(2, 3, "Thirty-Forty");
	TestData(2, 4, "Win for player2");	
	TestData(3, 4, "Advantage player2");
	TestData(4, 4, "Deuce");
	TestData(5, 3, "Win for player1");
	TestData(3, 5, "Win for player2");
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

function create_playing_game_for_Tenniskata2(player1_won_count::Int, player2_won_count::Int)::TennisGame2
	game = TennisGame2("", "") # names are not used
	for _ in range(; length = player1_won_count) 
		Tenniskata.won_point(game, "player1")
	end
	for _ in range(; length = player2_won_count) 
		Tenniskata.won_point(game, "player2")
	end
	return game
end

@testset "Tenniskata2_Test" begin
	for c in AllTestCase
		g = create_playing_game_for_Tenniskata2(c.Player1Point, c.Player2Point)
		@test Tenniskata.get_score(g) == c.Score
	end
end

function create_playing_game_for_Tenniskata3(player1_won_count::Int, player2_won_count::Int)::TennisGame3
	game = TennisGame3("player1", "player2")
	for _ in range(; length = player1_won_count) 
		Tenniskata.won_point(game, "player1")
	end
	for _ in range(; length = player2_won_count) 
		Tenniskata.won_point(game, "player2")
	end
	return game
end

@testset "Tenniskata3_Test" begin
	for c in AllTestCase
		g = create_playing_game_for_Tenniskata3(c.Player1Point, c.Player2Point)
		@test Tenniskata.get_score(g) == c.Score
	end
end
