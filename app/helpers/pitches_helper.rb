module PitchesHelper
  PITCH_TYPE_NAMES = {
    'ff'  =>  'Four Seam Fastball',
    'sl'  =>  'Slider',
    'ft'  =>  'Two Seam Fastball',
    'ch'  =>  'Changeup',
    'cu'  =>  'Curveball',
    'fc'  =>  'Cutter',
    'si'  =>  'Sinker',
    'fs'  =>  'Fastball',
    'fo'  =>  'Forkball',
    'fa'  =>  'Fastball',
    'sf'  =>  'Splitter',
  }
  PITCH_OUTCOME_NAMES = {
    's' => 'Strike',
    'b' => 'Ball',
    'x' => 'In Play'
  }
  def pitch_type_name(type)
    PITCH_TYPE_NAMES[type.downcase] || type
  end

  def pitch_outcome_name(type)
    PITCH_OUTCOME_NAMES[type.downcase] || type
  end
end
