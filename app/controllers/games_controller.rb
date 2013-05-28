class GamesController < ApplicationController

  def index
    @games = Gameday::Game.search(page: params.fetch(:page, 1)) do
      query { all }
    end
  end

  def show
    @game = Gameday::Game.find(params[:id])
  end

end
