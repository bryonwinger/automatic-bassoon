# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Default EffectTypes
fx_types = %w{Overdrive Distortion Fuzz Boost Modulation Chorus Flanger Phaser
  Tremolo Vibrato Rotary Delay Reverb Compression Equalization Pitch Octave}
fx_types.each do |fx|
  EffectType.create(name: fx)
end