class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attachment :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :practices, dependent: :destroy
  has_many :post_movies, dependent: :destroy
  
  validates :name, presence: true
end
