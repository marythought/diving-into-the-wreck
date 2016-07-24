class DecksController < ApplicationController
  def edit
    @deck = Deck.find(params[:id])
  end
end
