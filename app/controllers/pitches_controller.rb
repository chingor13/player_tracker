class PitchesController < ApplicationController
  include PlayersHelper
  helper PlayersHelper

  before_filter :set_tab

  def index
    @filters = filters = params.slice(:pitcher, :game_id, :pitch_type, :batter, :result).tap do |hash|
      hash.each {|k,v| hash[k] = Array(v)}
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
      facet 'batter' do
        terms :batter
      end
      facet 'pitch_type' do
        terms :pitch_type
      end
      facet 'result' do
        terms :result
      end
      facet 'game_id' do
        terms :game_id
      end
    end

    player_ids = @pitches.map(&:pitcher) + @pitches.map(&:batter) + @pitches.facets['pitcher']['terms'].map{|data| data['term']} + @pitches.facets['batter']['terms'].map{|data| data['term']}
    load_players(player_ids.uniq)
  end

  protected

  def set_tab
    set_current_tab(:pitches)
  end
end
