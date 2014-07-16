require "./choice"
require "./outcome"

class Game
  def initialize
    @wins = 0
    @games_played = 0
  end

  attr_reader :wins, :games_played

  def play
    welcome_message
    run_game
  end

  private

  def welcome_message
    puts "Welcome to Rock Paper Scissors!"
    puts "Are you ready to play?"
  end

  def run_game
    choice = Choice.new
    choice.set_up_choices
    run_game
  end
end

game = Game.new
game.play