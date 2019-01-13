class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # , :omniauthable, omniauth_providers: [:twitter]

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :age, presence: true, length: { maximum: 2 }
  validates :gender, presence: true, length: { maximum: 2 }
  validates :accepted, presence: { message: 'にチェックしてください' }, on: :create
end
