class EffectType < ApplicationRecord
  has_and_belongs_to_many :circuits
end
