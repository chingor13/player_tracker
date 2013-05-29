module PitchesHelper
  PITCH_TYPE_NAMES = {
    'ff'  =>  'Four Seam Fastball',
    'sl'  =>  'Slider',
    'ft'  =>  'Two Seam Fastball',
    'ch'  =>  'Changeup',
    'cu'  =>  'Curveball',
    'fc'  =>  'Cutter',
    'si'  =>  'Sinker',
    'fs'  =>  'FS',
    'fo'  =>  'Forkball',
    'fa'  =>  'FA',
  }
  def pitch_type(type)
    PITCH_TYPE_NAMES[type.downcase] || type
  end

  def pitcher_name(pitcher_id)
    if pitcher = pitcher_cache[pitcher_id]
      "#{pitcher.last}, #{pitcher.first}"
    else
      pitcher_id
    end
  end

  def pitcher_cache
    @pitcher_cache ||= {}
  end

  def load_pitchers(*pitcher_ids)
    pp Gameday::Player.find(*pitcher_ids)



    pitcher_cache.merge!(Gameday::Player.find(*pitcher_ids).index_by(&:id))
  end
end
