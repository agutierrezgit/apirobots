class Armor < ApplicationRecord
  
  #Associations
  belongs_to :robot

  #Validations
  validates :type, presence: true, inclusion: { in: [shield, magnetic field, invisible field],
    message: "%{value} is not a valid type" }
  validates :serial_number, format: { with: /\AA+\d{6}\z/, 
    message: "Please enter keywords in correct format (letter (A) + 6 digits)"}
end
