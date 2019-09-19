class Robot < ApplicationRecord
  
  #Associations
  belongs_to :user
  has_many :weapons
  has_many :armors

  #Validations
  validates :name, presence: true, uniqueness: true
  validates :type, inclusion: { in: %w(hackerobot protectobot tacticrobot),
    message: "%{value} is not a valid type" }

end
