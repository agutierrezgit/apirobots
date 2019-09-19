class Robot < ApplicationRecord
  
  #Associations
  belongs_to :user
  has_many :weapons
  has_many :armors

  #Validations
  validates :name, presence: true, uniqueness: true
  validates :type, presence: true, inclusion: { in: %w(hackerobot protectobot tacticrobot),
    message: "%{value} is not a valid type" }
  validates :serial_number, format: { with: /^R+\d{6}$/, 
    message: "Please enter keywords in correct format (letter (R) + 6 digits)"}

end
