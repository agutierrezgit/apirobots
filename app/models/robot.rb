class Robot < ApplicationRecord
  #Associations
  belongs_to :user
  has_many :weapons
  has_many :armors
end
