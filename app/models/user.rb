class User < ApplicationRecord
  # Use :username insead of :id for routing
  def to_param
    username
  end

  has_many :circuits, foreign_key: :submitter_id
  has_many :articles

  # Favorites
  has_many :user_circuit_favorites
  has_many :favorite_circuits, -> { distinct }, through: :user_circuit_favorites, source: :circuit

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 4..20 },
    format: { with: /\A[-_.A-z0-9]+\z/,
    message: "may only contain letters, numbers, hypens, underscores and periods"
  }

  def full_name
    "#{first_name} #{last_name}"
  end
end
