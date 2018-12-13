class ReviewsController < ApplicationController
  before_action :current_user_must_be_review_visitor, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_review_visitor
    review = Review.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == review.visitor
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @reviews = Review.page(params[:page]).per(10)

    render("review_templates/index.html.erb")
  end

  def show
    @review = Review.find(params.fetch("id_to_display"))

    render("review_templates/show.html.erb")
  end

  def new_form
    @review = Review.new

    render("review_templates/new_form.html.erb")
  end

  def create_row
    @review = Review.new

    @review.body = params.fetch("body")
    @review.reviewer_id = params.fetch("reviewer_id")
    @review.restaurant_id = params.fetch("restaurant_id")
    @review.bar_id = params.fetch("bar_id")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/reviews", :notice => "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_restaurant
    @review = Review.new

    @review.body = params.fetch("body")
    @review.reviewer_id = params.fetch("reviewer_id")
    @review.restaurant_id = params.fetch("restaurant_id")
    @review.bar_id = params.fetch("bar_id")

    if @review.valid?
      @review.save

      redirect_to("/restaurants/#{@review.restaurant_id}", notice: "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_bar
    @review = Review.new

    @review.body = params.fetch("body")
    @review.reviewer_id = params.fetch("reviewer_id")
    @review.restaurant_id = params.fetch("restaurant_id")
    @review.bar_id = params.fetch("bar_id")

    if @review.valid?
      @review.save

      redirect_to("/bars/#{@review.bar_id}", notice: "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @review = Review.find(params.fetch("prefill_with_id"))

    render("review_templates/edit_form.html.erb")
  end

  def update_row
    @review = Review.find(params.fetch("id_to_modify"))

    @review.body = params.fetch("body")
    
    @review.restaurant_id = params.fetch("restaurant_id")
    @review.bar_id = params.fetch("bar_id")

    if @review.valid?
      @review.save

      redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
    else
      render("review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_visitor
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/users/#{@review.reviewer_id}", notice: "Review deleted successfully.")
  end

  def destroy_row_from_restaurant
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/restaurants/#{@review.restaurant_id}", notice: "Review deleted successfully.")
  end

  def destroy_row_from_bar
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/bars/#{@review.bar_id}", notice: "Review deleted successfully.")
  end

  def destroy_row
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/reviews", :notice => "Review deleted successfully.")
  end
end
