Rails.application.routes.draw do
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
