class DirectorsController < ApplicationController
  def index
    @directors = Director.all
  end

  def show
    @director = Director.find(params[:id])
    render("/directors/show_details")
  end

  def new_form
    render("/directors/new_form")
  end

  def create_row
    dob = params[:dob]
    name = params[:name]
    bio = params[:bio]
    image_url = params[:image_url]
    @director = Director.new
    @director.dob = dob
    @director.name = name
    @director.bio = bio
    @director.image_url = image_url
    @director.save
    redirect_to("/directors")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    the_id = params[:id]
    dob = params[:dob]
    name = params[:name]
    bio = params[:bio]
    image_url = params[:image_url]
    @director = Director.find(the_id)
    @director.dob = dob
    @director.name = name
    @director.bio = bio
    @director.image_url = image_url
    @director.save


    redirect_to("/directors/#{the_id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
