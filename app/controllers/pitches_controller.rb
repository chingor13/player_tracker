class PitchesController < ApplicationController
  include PitchesHelper

  def index
    filters = params.slice(:pitcher, :game_id, :pitch_type, :batter).tap do |hash|
      hash.each {|k,v| hash[k] = [v]}
    end
    @pitches = Gameday::Pitch.search(page: params.fetch(:page, 1), per_page: 30) do
      query do 
        if filters.empty?
          all
        else
          boolean do
            filters.each do |k, v|
              must { terms k, v}
            end
          end
        end
      end
      #filter :terms, filters
      facet 'pitcher' do
        terms :pitcher
      end
      facet 'pitch_type' do
        terms :pitch_type
      end
    end

    load_pitchers(@pitches.map(&:pitcher))
  end
end
