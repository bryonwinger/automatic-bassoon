class Circuit < ApplicationRecord
  belongs_to :submitter, class_name: "User", foreign_key: "user_id"
  has_and_belongs_to_many :effect_types
end
