class BarsController < ApplicationController
  def index
    @q = Bar.ransack(params[:q])
    @bars = @q.result(:distinct => true).includes(:attendees, :reviews, :friends_going, :confirmed_guests).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@bars.where.not(:location_latitude => nil)) do |bar, marker|
      marker.lat bar.location_latitude
      marker.lng bar.location_longitude
      marker.infowindow "<h5><a href='/bars/#{bar.id}'>#{bar.name}</a></h5><small>#{bar.location_formatted_address}</small>"
    end

    render("bar_templates/index.html.erb")
  end

  def show
    @review = Review.new
    @attendence = Attendence.new
    @bar = Bar.find(params.fetch("id_to_display"))

    render("bar_templates/show.html.erb")
  end

  def new_form
    @bar = Bar.new

    render("bar_templates/new_form.html.erb")
  end

  def create_row
    @bar = Bar.new

    @bar.name = params.fetch("name")
    @bar.location = params.fetch("location")
    @bar.drink_deal = params.fetch("drink_deal")

    if @bar.valid?
      @bar.save

      redirect_back(:fallback_location => "/bars", :notice => "Bar created successfully.")
    else
      render("bar_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @bar = Bar.find(params.fetch("prefill_with_id"))

    render("bar_templates/edit_form.html.erb")
  end

  def update_row
    @bar = Bar.find(params.fetch("id_to_modify"))

    @bar.name = params.fetch("name")
    @bar.location = params.fetch("location")
    @bar.drink_deal = params.fetch("drink_deal")

    if @bar.valid?
      @bar.save

      redirect_to("/bars/#{@bar.id}", :notice => "Bar updated successfully.")
    else
      render("bar_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @bar = Bar.find(params.fetch("id_to_remove"))

    @bar.destroy

    redirect_to("/bars", :notice => "Bar deleted successfully.")
  end
end
