class StartController < ApplicationController
  def index
    @deck = Deck.create
  end
end
