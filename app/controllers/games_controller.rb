class GamesController < ApplicationController

  before_filter :set_tab

  def index
    @games = Gameday::Game.search(page: params.fetch(:page, 1)) do
      query { all }
    end
  end

  def show
    @game = Gameday::Game.find(params[:id])
  end

  protected

  def set_tab
    set_current_tab(:games)
  end

end
