class UserCircuitFavorite < ApplicationRecord
  belongs_to :circuit
  belongs_to :user
end
