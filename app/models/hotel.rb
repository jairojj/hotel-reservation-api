class Hotel < ApplicationRecord
  
   # validations
  validates_presence_of :name, :localization 
  
end
