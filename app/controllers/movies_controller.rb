class MoviesController < ApplicationController

  # Afficher tous les movies
  def index
    @movies = Movie.all
  end

  # Afficher détail d'un movie
  def show
    @movie = Movie.find(params[:id])
  end
end
