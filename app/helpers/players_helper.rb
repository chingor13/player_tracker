module PlayersHelper
  def player_name(player_id)
    if player = player_cache[player_id]
      "#{player.last}, #{player.first}"
    else
      player_id
    end
  end

  def player_cache
    @player_cache ||= {}
  end

  def load_players(*player_ids)
    player_cache.merge!(Gameday::Player.find(*player_ids).index_by(&:id))
  end
end
