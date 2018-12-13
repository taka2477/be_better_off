class Post < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
