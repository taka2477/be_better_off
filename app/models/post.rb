class Post < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :budget, presence: true, length: { maximum: 30 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1500 }
  validate :image_size
  scope :latest_posts, -> { order(created_at: :desc) }
  mount_uploader :image, ImageUploader

  private

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "5MB以下でお願いします")
    end
  end
end
