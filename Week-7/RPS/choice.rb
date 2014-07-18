class Choice
  CHOICES = %w(P R S)
  QUIT_CHOICE = "Q"

  def initialize
    @player_choice = ""
    @ai_choice = ""
  end

  def set_up_choices
    make_choice
    set_ai_choice
    set_outcome
  end

  private

  def make_choice
    while invalid_choice?
      prompt_entry
      @player_choice = gets.chomp
      validate_choice
    end
  end

  def prompt_entry
    print "Enter R/P/S to make a choice, or Q to quit. > "
  end

  def validate_choice
    quit_game_if_player_wants_to
    if invalid_choice?
      puts "That's not a valid choice!"
    end
  end

  def invalid_choice?
    !CHOICES.include?(@player_choice)
  end

  def quit_game_if_player_wants_to
    if player_is_quitting?
      puts "Ending game, see you next time!"
      exit
    end
  end 

  def player_is_quitting?
    @player_choice == QUIT_CHOICE
  end

  def set_ai_choice
    @ai_choice = CHOICES.sample
  end

  def set_outcome
    puts "Player uses #{@player_choice}, AI uses #{@ai_choice}!"
    outcome = Outcome.new(@player_choice + @ai_choice)
  end
end