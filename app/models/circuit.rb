class Circuit < ApplicationRecord
  belongs_to :submitter, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :effect_types

  # Favorites
  has_many :user_circuit_favorites
  has_many :favorite_users, through: :user_circuit_favorites, source: :user
end
