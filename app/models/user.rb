class User < ApplicationRecord
  # Token Authenticatable
  acts_as_token_authenticatable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #Associations
  has_many :robots, dependent: :destroy
  has_many :weapons, through: :robots
  has_many :armors, through: :robots
end
