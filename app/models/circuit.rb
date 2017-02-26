class Circuit < ApplicationRecord
  belongs_to :submitter, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :effect_types, -> { distinct }
  has_many :articles, -> { distinct }, as: :documentable

  # Favorites
  has_many :user_circuit_favorites
  has_many :favorited_users, -> { distinct }, through: :user_circuit_favorites, source: :user

  validates :name, presence: true, uniqueness: true
  validates :difficulty, presence: true
  validates :submitter, presence: true
  validates :effect_types, length: { minimum: 1 }

  def effect_type_ids_string
    effect_types.map(&:id).join(",")
  end
end
