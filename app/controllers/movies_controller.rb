class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
    render("/movies/new_form")
  end

  def create_row
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]
    @movie = Movie.new
    @movie.title = title
    @movie.year = year
    @movie.duration = duration
    @movie.description = description
    @movie.image_url = image_url
    @movie.director_id = director_id
    @movie.save
    redirect_to("/movies")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie = Movie.find(params[:id])
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    render("show")
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
  end
end
