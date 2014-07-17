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
    compare_choices
  end

  private

  def make_choice
    while is_choice_valid? == false do
    prompt_entry
    @player_choice = gets.chomp
    validate_choice
    end
  end

  def prompt_entry
    print "Enter R/P/S to make a choice, or Q to quit. > "
  end

  def validate_choice
    quit_game_if_player_wants_to!
    if !is_choice_valid?
      puts "That's not a valid choice!"
    end
  end

  def is_choice_valid?
    CHOICES.include?(@player_choice)
  end

  def quit_game_if_player_wants_to!
    if is_player_quitting?
      puts "Ending game, see you next time!"
      exit
    end
  end 

  def is_player_quitting?
    @player_choice == QUIT_CHOICE
  end

  def set_ai_choice
    @ai_choice = CHOICES.sample
  end

  def compare_choices
    puts "Player uses #{@player_choice}, AI uses #{@ai_choice}!"
    outcome = Outcome.new(@player_choice + @ai_choice)
  end
end