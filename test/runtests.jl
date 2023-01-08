include("../src/Tenniskata.jl")
include("../src/Tenniskata1.jl")
include("../src/Tenniskata2.jl")
include("../src/Tenniskata3.jl")

using Test

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
	@testset "Love All" begin
		game = create_playing_game_for_Tenniskata1(0, 0)
		@test Tenniskata.get_score(game) == "Love-All"
	end
	@testset "Fifteen Love" begin
		game = create_playing_game_for_Tenniskata1(1, 0)
		@test Tenniskata.get_score(game) == "Fifteen-Love"	
	end
end
