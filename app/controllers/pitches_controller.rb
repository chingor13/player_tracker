class PitchesController < ApplicationController

  def index
    filters = params.slice(:pitcher, :game_id, :pitch_type, :batter).tap do |hash|
      hash.each {|k,v| hash[k] = [v]}
    end
    @pitches = Gameday::Pitch.search(page: params.fetch(:page, 1)) do
      query { all }
      filter :terms, filters
    end
  end
end
