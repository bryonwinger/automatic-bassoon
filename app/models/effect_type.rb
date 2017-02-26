class EffectType < ApplicationRecord
  has_and_belongs_to_many :circuits
  validates :name, presence: true, uniqueness: true
end
