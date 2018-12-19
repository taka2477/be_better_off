class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1500 }
end
