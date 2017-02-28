class User < ApplicationRecord
  has_many :circuits, foreign_key: :submitter_id
  has_many :articles

  # Favorites
  has_many :user_circuit_favorites
  has_many :favorite_circuits, -> { distinct }, through: :user_circuit_favorites, source: :circuit

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
