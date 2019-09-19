class Robot < ApplicationRecord
  
  #Associations
  belongs_to :user
  has_many :weapons
  has_many :armors

  #Validations
  validates :name, presence: true, uniqueness: true
end
