# DECKS

# ID				NAME OF DECK


# CARD

# ID		FOREIGN-KEY		QUESTION	ANSWER	


require "sinatra"
require "active_record"
require "pg"
require "sinatra/reloader"

#Make a Flashcard app with Sinatra. Feel free to pair, or work alone.

# You should be able to:

#     view a list of decks
#     create a deck
#     edit a deck
#     view a deck
#     create a card in a deck
#     play a deck


#frontpage
  # ---- Show decks
  # --------view cards in deck
  # --------edit cards in deck
  # ---- Add decks
  # --------add cards to new deck
  # ---- Play deck
  # --------take random card from deck
  # --------ask QUESTION
  # --------show answer right/wrong

  ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  database: "flashcards",
  )

  class Deck < ActiveRecord::Base
    has_many :cards, dependent: :destroy
  end

  class Card < ActiveRecord::Base
  end

  get "/" do
    @decks = Deck.all
    erb :index
  end

  get "/decks/:deck_id" do
    @decks = Deck.find(params[:deck_id])
    @cards = @decks.cards
    erb :view
  end

  delete "/decks/:deck_id/:card_id" do
    card = card.find(params[:card_id])
    card.destroy
  end

  



