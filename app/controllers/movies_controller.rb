class MoviesController < ApplicationController
  def index
    @movies = HTTParty.get("http://www.omdbapi.com/?apikey=b7fa400a&type=movie&s=latest")
    render json: @movies
  end

  def search
    @search_term = params[:search]
    response = HTTParty.get("http://www.omdbapi.com/?apikey=b7fa400a&type=movie&s=#{@search_term}")
    @search_results = JSON.parse(response.body)['Search']
    render json: response
  end

  def add_to_favorites
    movie_id = params[:id]
    @movie = HTTParty.get("http://www.omdbapi.com/?i=#{movie_id}&apikey=b7fa400a&type=movie")
    @movie.update(favorite: true)
    render json: @movie
  end

  def favorites
    @favorite_movies = HTTParty.get("http://www.omdbapi.com/?apikey=b7fa400a&type=movie&favorite=true")
    render json: @favorite_movies
  end
end
