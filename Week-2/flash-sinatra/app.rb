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

  get "/decks/:deck_id/new_card" do
    @decks = Deck.find(params[:deck_id])
    erb :new_card
  end

  get "/decks/:deck_id/edit_card" do
    @decks = Deck.find(params[:deck_id])
    erb :edit_card
  end

  patch "/decks/:deck_id/" do
    card = Card.find(params[:deck_id])
    card.update(params[:card])
    redirect "decks/#{params[deck.id]}"
  end

  post "/decks/:deck_id/new_card" do
    question = params[:card]
    # answer = params[:card]
    deck_id = {deck_id: params[:deck_id]}
    # row_hash = question.merge(answer)
    row_hash = question.merge(deck_id)
    # raise row_hash.inspect
    Card.create(row_hash)
    redirect "/decks/#{params[:deck_id]}"
  end

  delete "/decks/:deck_id/:card_id" do
    card = Card.find(params[:card_id])
    card.destroy
  end
