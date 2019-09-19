class Weapon < ApplicationRecord
  
  #Associations
  belongs_to :robot

  #Validations
  validates :type, presence: true, inclusion: { in: %w(laser code acid map),
    message: "%{value} is not a valid type" }
  validates :serial_number, format: { with: /^W+\d{6}$/, 
    message: "Please enter keywords in correct format (letter (W) + 6 digits)"}
end
