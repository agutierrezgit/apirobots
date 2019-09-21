class Robot < ApplicationRecord
  
  #Associations
  belongs_to :user
  has_many :weapons, dependent: :destroy
  has_many :armors, dependent: :destroy

  #Validations
  validates :name, presence: true, uniqueness: true
  validates :robot_type, presence: true, inclusion: { in: %w(hackerobot protectobot tacticrobot),
    message: "%{value} is not a valid type" }
  validates :serial_number, format: { with: /\AR+\d{6}\z/, 
    message: "Please enter keywords in correct format (letter (R) + 6 digits)"}

  #Search
  include PgSearch::Model
  pg_search_scope :custom_search,
    against: :robot_type,
    associated_against: {
      weapons: :weapon_type,
      armors: :armor_type
    },

    using: {
      tsearch: { prefix: true }
    }
end
