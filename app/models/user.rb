class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # , :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true, uniqueness: true, length: { maximum: 15 }
  validates :age, presence: true, length: { maximum: 2 }
  validates :gender, presence: true, length: { maximum: 2 }
end
