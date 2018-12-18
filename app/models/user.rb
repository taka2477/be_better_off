class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # , :omniauthable, omniauth_providers: [:twitter]

  validates :username, presence: true, uniqueness: true
  validates :age, presence: true
  validates :gender, presence: true

end
