class User < ApplicationRecord
  has_many :circuits
  has_many :articles

  # Favorites
  has_many :user_circuit_favorites
  has_many :favorite_circuits, through: :user_circuit_favorites , source: :circuit
end
