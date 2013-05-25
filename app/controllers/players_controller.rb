require 'pp'
class PlayersController < ApplicationController

  def index
    @players = Gameday::Player.all
    pp @players
  end

  def show
    @player = Gameday::Player.find(params[:id])
  end

end
