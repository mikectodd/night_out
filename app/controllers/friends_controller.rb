class FriendsController < ApplicationController
  before_action :current_user_must_be_friend_user, :only => [:show, :edit_form, :update_row, :destroy_row]

  def current_user_must_be_friend_user
    friend = Friend.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == friend.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.friends.ransack(params[:q])
    @friends = @q.result(:distinct => true).includes(:user, :attendences, :bar_attended_by_friend, :restaurant_attended_by_friend).page(params[:page]).per(10)

    render("friend_templates/index.html.erb")
  end

  def show
    @attendence = Attendence.new
    @friend = Friend.find(params.fetch("id_to_display"))

    render("friend_templates/show.html.erb")
  end

  def new_form
    @friend = Friend.new

    render("friend_templates/new_form.html.erb")
  end

  def create_row
    @friend = Friend.new

    @friend.friend_id = params.fetch("friend_id")

    if @friend.valid?
      @friend.save

      redirect_back(:fallback_location => "/friends", :notice => "Friend created successfully.")
    else
      render("friend_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @friend = Friend.find(params.fetch("prefill_with_id"))

    render("friend_templates/edit_form.html.erb")
  end

  def update_row
    @friend = Friend.find(params.fetch("id_to_modify"))

    

    if @friend.valid?
      @friend.save

      redirect_to("/friends/#{@friend.id}", :notice => "Friend updated successfully.")
    else
      render("friend_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @friend = Friend.find(params.fetch("id_to_remove"))

    @friend.destroy

    redirect_to("/users/#{@friend.friend_id}", notice: "Friend deleted successfully.")
  end

  def destroy_row
    @friend = Friend.find(params.fetch("id_to_remove"))

    @friend.destroy

    redirect_to("/friends", :notice => "Friend deleted successfully.")
  end
end
