class Outcome
  WIN_CASES = ["PR", "RS", "SP"]
  LOSE_CASES = ["RP", "PS", "SR"]

  def initialize(outcome)
    @outcome = outcome
    check_outcome
  end

  def check_outcome
    if win?
      declare_winner("Player", "AI")
    elsif lose?
      declare_winner("AI", "Player")
    else
      draw_game
    end   
  end

  private
  
  def win?
    WIN_CASES.include?(@outcome)
  end

  def lose?
    LOSE_CASES.include?(@outcome)
  end

  def draw_game
    puts "The game is a draw!"
  end

  def declare_winner(winner, loser)
    puts "#{winner} is the winner! Sorry, #{loser}!"
  end
end