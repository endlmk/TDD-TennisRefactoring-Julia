mutable struct TennisGame2
    P1point::Int
	P2point::Int

	P1res::String
	P2res::String
	player1Name::String
	player2Name::String

    TennisGame2(player1Name, player2Name) = new(0, 0, "", "", player1Name, player2Name)
end

ordinalScoreArray = [
	"Love";
	"Fifteen";
	"Thirty";
	"Forty";
]
function ordinalScore(s::Int)::String
	return ordinalScoreArray[s + 1]
end

function Tenniskata.get_score(game::TennisGame2)
	if game.P1point == game.P2point 
		return game.P1point < 3 ? ordinalScore(game.P1point) * "-All" : "Deuce"
    end

	if game.P1point < 4 && game.P2point < 4
		return ordinalScore(game.P1point) * "-" * ordinalScore(game.P2point)
    end

	advPlayer = game.P1point > game.P2point ? "player1" : "player2"
	diff = abs(game.P1point - game.P2point)

	if diff >= 2
		return "Win for " * advPlayer
    end

	if diff == 1
		return "Advantage " * advPlayer
	end
end

set_p1_score(game::TennisGame2, number::Int) = for _ = 1:number p1_score(game) end
set_p2_score(game::TennisGame2, number::Int) = for _ = 1:number p2_score(game) end

function p1_score(game::TennisGame2)
    game.P1point += 1
end

function p2_score(game::TennisGame2)
    game.P2point += 1
end

function Tenniskata.won_point(game::TennisGame2, player::String) 
	if player == "player1"
		p1_score(game)
	else
		p2_score(game)
    end
end