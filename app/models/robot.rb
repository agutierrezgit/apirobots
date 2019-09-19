class Robot < ApplicationRecord
  
  #Associations
  belongs_to :user
  has_many :weapons
  has_many :armors

  #Validations
  validates :name, presence: true, uniqueness: true
  validates :robot_type, presence: true, inclusion: { in: %w(hackerobot protectobot tacticrobot),
    message: "%{value} is not a valid type" }
  validates :serial_number, format: { with: /\AR+\d{6}\z/, 
    message: "Please enter keywords in correct format (letter (R) + 6 digits)"}

end
