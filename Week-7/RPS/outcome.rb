class Outcome
  WIN_CASES = ["PR", "RS", "SP"]
  LOSE_CASES = ["RP", "PS", "SR"]

  def initialize(outcome)
    @outcome = outcome
    check_outcome
  end

  def check_outcome
    if win?
    elsif lose?
    else
      draw_game
    end   
  end

  private
  
  def win?
    if WIN_CASES.include?(@outcome)
      declare_winner("Player", "AI")
      # game.wins += 1
      # game.games_played += game.games_played+1
    end
  end

  def lose?
    if LOSE_CASES.include?(@outcome)
      declare_winner("AI", "Player")
      # game.games_played += 1
    end
  end

  def draw_game
    puts "The game is a draw!"
  end

  def declare_winner(winner, loser)
    puts "#{winner} is the winner! Sorry, #{loser}!"
  end
end