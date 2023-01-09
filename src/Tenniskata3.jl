mutable struct TennisGame3
    p2::Int
	p1::Int
	p1N::String
	p2N::String

    TennisGame3(p1N, p2N) = new(0, 0, p1N, p2N)
end

function Tenniskata.get_score(game::TennisGame3)
	if game.p1 < 4 && game.p2 < 4 && !(game.p1 == 3 && game.p2 == 3)
		p = Dict(0 => "Love", 1 => "Fifteen", 2 => "Thirty", 3 => "Forty")
		return game.p1 == game.p2 ? p[game.p1] * "-All" : p[game.p1] * "-" * p[game.p2]
	else
		if game.p1 == game.p2
			return "Deuce"
        end
		s = game.p1 > game.p2 ? game.p1N : game.p2N
		return (abs(game.p1-game.p2) == 1 ? "Advantage " : "Win for ") * s
    end
end

function Tenniskata.won_point(game::TennisGame3, playerName::String)
	if playerName == "player1"
		game.p1 += 1
	else
		game.p2 += 1
    end
end