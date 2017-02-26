class Article < ApplicationRecord
  belongs_to :documentable, polymorphic: true
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  validates :author, presence: true

  validates :title, presence: true, uniqueness: true
  validates :body, presence: true
end
