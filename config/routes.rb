Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:results", { :controller => "users", :action => "show"})
end
