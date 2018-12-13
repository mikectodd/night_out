class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @location_hash = Gmaps4rails.build_markers(@restaurants.where.not(:location_latitude => nil)) do |restaurant, marker|
      marker.lat restaurant.location_latitude
      marker.lng restaurant.location_longitude
      marker.infowindow "<h5><a href='/restaurants/#{restaurant.id}'>#{restaurant.name}</a></h5><small>#{restaurant.location_formatted_address}</small>"
    end

    render("restaurant_templates/index.html.erb")
  end

  def show
    @review = Review.new
    @attendence = Attendence.new
    @restaurant = Restaurant.find(params.fetch("id_to_display"))

    render("restaurant_templates/show.html.erb")
  end

  def new_form
    @restaurant = Restaurant.new

    render("restaurant_templates/new_form.html.erb")
  end

  def create_row
    @restaurant = Restaurant.new

    @restaurant.name = params.fetch("name")
    @restaurant.image = params.fetch("image") if params.key?("image")
    @restaurant.location = params.fetch("location")
    @restaurant.food = params.fetch("food")

    if @restaurant.valid?
      @restaurant.save

      redirect_back(:fallback_location => "/restaurants", :notice => "Restaurant created successfully.")
    else
      render("restaurant_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @restaurant = Restaurant.find(params.fetch("prefill_with_id"))

    render("restaurant_templates/edit_form.html.erb")
  end

  def update_row
    @restaurant = Restaurant.find(params.fetch("id_to_modify"))

    @restaurant.name = params.fetch("name")
    @restaurant.image = params.fetch("image") if params.key?("image")
    @restaurant.location = params.fetch("location")
    @restaurant.food = params.fetch("food")

    if @restaurant.valid?
      @restaurant.save

      redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
    else
      render("restaurant_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @restaurant = Restaurant.find(params.fetch("id_to_remove"))

    @restaurant.destroy

    redirect_to("/restaurants", :notice => "Restaurant deleted successfully.")
  end
end
