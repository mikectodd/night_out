class AttendencesController < ApplicationController
  before_action :current_user_must_be_attendence_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_attendence_user
    attendence = Attendence.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == attendence.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.attendances.ransack(params[:q])
    @attendences = @q.result(:distinct => true).includes(:user, :restaurant, :bar).page(params[:page]).per(10)

    render("attendence_templates/index.html.erb")
  end

  def show
    @attendence = Attendence.find(params.fetch("id_to_display"))

    render("attendence_templates/show.html.erb")
  end

  def new_form
    @attendence = Attendence.new

    render("attendence_templates/new_form.html.erb")
  end

  def create_row
    @attendence = Attendence.new

    @attendence.user_id = params.fetch("user_id")
    @attendence.restaurant_id = params.fetch("restaurant_id")
    @attendence.bar_id = params.fetch("bar_id")

    if @attendence.valid?
      @attendence.save

      redirect_back(:fallback_location => "/attendences", :notice => "Attendence created successfully.")
    else
      render("attendence_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_restaurant
    @attendence = Attendence.new

    @attendence.user_id = params.fetch("user_id")
    @attendence.restaurant_id = params.fetch("restaurant_id")
    @attendence.bar_id = params.fetch("bar_id")

    if @attendence.valid?
      @attendence.save

      redirect_to("/restaurants/#{@attendence.restaurant_id}", notice: "Attendence created successfully.")
    else
      render("attendence_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_bar
    @attendence = Attendence.new

    @attendence.user_id = params.fetch("user_id")
    @attendence.restaurant_id = params.fetch("restaurant_id")
    @attendence.bar_id = params.fetch("bar_id")

    if @attendence.valid?
      @attendence.save

      redirect_to("/bars/#{@attendence.bar_id}", notice: "Attendence created successfully.")
    else
      render("attendence_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @attendence = Attendence.find(params.fetch("prefill_with_id"))

    render("attendence_templates/edit_form.html.erb")
  end

  def update_row
    @attendence = Attendence.find(params.fetch("id_to_modify"))

    
    @attendence.restaurant_id = params.fetch("restaurant_id")
    @attendence.bar_id = params.fetch("bar_id")

    if @attendence.valid?
      @attendence.save

      redirect_to("/attendences/#{@attendence.id}", :notice => "Attendence updated successfully.")
    else
      render("attendence_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @attendence = Attendence.find(params.fetch("id_to_remove"))

    @attendence.destroy

    redirect_to("/users/#{@attendence.user_id}", notice: "Attendence deleted successfully.")
  end

  def destroy_row_from_restaurant
    @attendence = Attendence.find(params.fetch("id_to_remove"))

    @attendence.destroy

    redirect_to("/restaurants/#{@attendence.restaurant_id}", notice: "Attendence deleted successfully.")
  end

  def destroy_row_from_bar
    @attendence = Attendence.find(params.fetch("id_to_remove"))

    @attendence.destroy

    redirect_to("/bars/#{@attendence.bar_id}", notice: "Attendence deleted successfully.")
  end

  def destroy_row
    @attendence = Attendence.find(params.fetch("id_to_remove"))

    @attendence.destroy

    redirect_to("/attendences", :notice => "Attendence deleted successfully.")
  end
end
