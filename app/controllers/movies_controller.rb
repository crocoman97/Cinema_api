
class MoviesController < ApplicationController
  
  get '/movies' do 
    redirect '/login' if !logged_in?
    @movies = Movie.all 
    @customer = current_user
    erb :'/movies/index'
  end
  
  get '/movies/new' do 
    redirect '/login' if !logged_in?
    if @customer.name = "admin"
      erb :'/movies/new'
    else 
      redirect '/movies'  
    end
  end
    
  get '/movies/:id' do
    if logged_in?
      @movie = Movie.find_by_id(params[:id])
      @customer = @movie.customer
      erb :'movies/show'
    else
      redirect to '/login'
    end
  end
    
  post '/movies' do 
    if params[:content] != ""
      @movie = Tweet.create(content: params[:content])
      @customer = User.find(current_user.id)
      @movie.user = @customer
      @movie.save
      redirect "/movies/#{@movie.id}"
    end 
    redirect '/movies/new'
  end
    


  
  get '/movies/:id/edit' do 
    redirect '/login' unless logged_in?
    @movie = Tweet.find(params[:id])
    redirect '/movies' unless @movie.customer == current_user
    erb :'/movies/edit'
  end
  
  patch '/movies/:id' do 
    @movie = Tweet.find(params[:id])
    if params[:content] != ""
      @movie.update(content: params[:content])
      redirect "/movies/#{@movie.id}"
    end
    redirect "/movies/#{@movie.id}/edit"
  end
  

  delete '/movies/:id/delete' do 
    redirect '/' unless logged_in?
    @movie = Tweet.find(params[:id])
    if @movie.user == current_user
      @movie.delete
    end
    redirect '/movies'
  end
  
end