class Hotel < ApplicationRecord
  has_many :rooms, dependent: :destroy
  
   # validations
  validates_presence_of :name, :localization 
  
end
