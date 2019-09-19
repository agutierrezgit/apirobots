class Weapon < ApplicationRecord
  
  #Associations
  belongs_to :robot
  belongs_to :user, optional: true

  #Validations
  validates :weapon_type, presence: true, inclusion: { in: %w(laser code acid map),
    message: "%{value} is not a valid type" }
  validates :serial_number, format: { with: /\AW+\d{6}\z/, 
    message: "Please enter keywords in correct format (letter (W) + 6 digits)"}
end
