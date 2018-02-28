class Movie < ActiveRecord::Base 
  
  has_many :customers, through: :tickets
  has_many :tickets
  
end