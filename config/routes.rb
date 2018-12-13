Rails.application.routes.draw do
  # Routes for the Bar resource:

  # CREATE
  get("/bars/new", { :controller => "bars", :action => "new_form" })
  post("/create_bar", { :controller => "bars", :action => "create_row" })

  # READ
  get("/bars", { :controller => "bars", :action => "index" })
  get("/bars/:id_to_display", { :controller => "bars", :action => "show" })

  # UPDATE
  get("/bars/:prefill_with_id/edit", { :controller => "bars", :action => "edit_form" })
  post("/update_bar/:id_to_modify", { :controller => "bars", :action => "update_row" })

  # DELETE
  get("/delete_bar/:id_to_remove", { :controller => "bars", :action => "destroy_row" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  get("/reviews/new", { :controller => "reviews", :action => "new_form" })
  post("/create_review", { :controller => "reviews", :action => "create_row" })

  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  get("/reviews/:id_to_display", { :controller => "reviews", :action => "show" })

  # UPDATE
  get("/reviews/:prefill_with_id/edit", { :controller => "reviews", :action => "edit_form" })
  post("/update_review/:id_to_modify", { :controller => "reviews", :action => "update_row" })

  # DELETE
  get("/delete_review/:id_to_remove", { :controller => "reviews", :action => "destroy_row" })

  #------------------------------

  # Routes for the Friend request resource:

  # CREATE
  get("/friend_requests/new", { :controller => "friend_requests", :action => "new_form" })
  post("/create_friend_request", { :controller => "friend_requests", :action => "create_row" })

  # READ
  get("/friend_requests", { :controller => "friend_requests", :action => "index" })
  get("/friend_requests/:id_to_display", { :controller => "friend_requests", :action => "show" })

  # UPDATE
  get("/friend_requests/:prefill_with_id/edit", { :controller => "friend_requests", :action => "edit_form" })
  post("/update_friend_request/:id_to_modify", { :controller => "friend_requests", :action => "update_row" })

  # DELETE
  get("/delete_friend_request/:id_to_remove", { :controller => "friend_requests", :action => "destroy_row" })

  #------------------------------

  # Routes for the Attendence resource:

  # CREATE
  get("/attendences/new", { :controller => "attendences", :action => "new_form" })
  post("/create_attendence", { :controller => "attendences", :action => "create_row" })

  # READ
  get("/attendences", { :controller => "attendences", :action => "index" })
  get("/attendences/:id_to_display", { :controller => "attendences", :action => "show" })

  # UPDATE
  get("/attendences/:prefill_with_id/edit", { :controller => "attendences", :action => "edit_form" })
  post("/update_attendence/:id_to_modify", { :controller => "attendences", :action => "update_row" })

  # DELETE
  get("/delete_attendence/:id_to_remove", { :controller => "attendences", :action => "destroy_row" })

  #------------------------------

  # Routes for the Restaurant resource:

  # CREATE
  get("/restaurants/new", { :controller => "restaurants", :action => "new_form" })
  post("/create_restaurant", { :controller => "restaurants", :action => "create_row" })

  # READ
  get("/restaurants", { :controller => "restaurants", :action => "index" })
  get("/restaurants/:id_to_display", { :controller => "restaurants", :action => "show" })

  # UPDATE
  get("/restaurants/:prefill_with_id/edit", { :controller => "restaurants", :action => "edit_form" })
  post("/update_restaurant/:id_to_modify", { :controller => "restaurants", :action => "update_row" })

  # DELETE
  get("/delete_restaurant/:id_to_remove", { :controller => "restaurants", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
