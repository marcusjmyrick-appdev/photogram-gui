class UsersController < ApplicationController
  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show.html.erb"})
  end
  def create
    input_username = params.fetch("input_username")
    

    a_new_user = User.new

    a_new_user.username = input_username

    a_new_user.save

    redirect_to("/users/" + input_username)
  end
  def update
    input_username = params.fetch("input_username")
    user_id = params.fetch("user_id")

    matching_users = User.where({ :id => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = input_username
    
    the_user.save

    # render({ :template => "user_templates/update.html.erb"})
    redirect_to("/users/" + input_username)
  end
end
