require 'pp'
class PlayersController < ApplicationController

  before_filter :set_tab

  def index
    @players = Gameday::Player.all
  end

  def show
    @player = Gameday::Player.find(params[:id])
  end

  protected

  def set_tab
    set_current_tab(:pitches)
  end

end
