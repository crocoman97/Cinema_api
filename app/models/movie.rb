class Movie < ActiveRecord::Base 
  
  has_many :tickets
  has_many :movie_customers
  has_many :customers, through: :movie_customers
  
end