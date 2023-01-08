mutable struct TennisGame1
    m_score1::Int
	m_score2::Int
	player1Name::String
	player2Name::String

    TennisGame1(player1Name, player2Name) = new(0, 0, player1Name, player2Name)
end

function Tenniskata.won_point(game::TennisGame1, playerName::String)
    if playerName == "player1"
        game.m_score1 += 1
    else
        game.m_score2 += 1
    end
end

function ordinalScore(s::Int)::String
    if s == 0
        return "Love"
    elseif s == 1
        return "Fifteen"
    elseif s == 2
        return "Thirty"
    elseif s == 3
        return "Forty"
    end
end

function Tenniskata.get_score(game::TennisGame1)
    if game.m_score1 == game.m_score2 && game.m_score1 >= 3
        return "Deuce"
    elseif game.m_score1 == game.m_score2 && game.m_score1 <= 2
		return "$(ordinalScore(game.m_score1))-All"
    elseif game.m_score1 >= 4 || game.m_score2 >= 4
        advPlayer = game.m_score1 > game.m_score2 ? "player1" : "player2"
        diff = abs(game.m_score1 - game.m_score2)
        if diff == 1
			return "Advantage " * advPlayer
		else
			return "Win for " * advPlayer
        end
    else
        return "$(ordinalScore(game.m_score1))-$(ordinalScore(game.m_score2))"
    end
end
