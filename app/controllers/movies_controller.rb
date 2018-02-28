
class MoviesController < ApplicationController
  
  get '/movies' do 
    redirect '/login' if !logged_in?
    @movies = Movie.all 
    @customer = current_user
    erb :'/movies/index'
  end
  
  
  
end