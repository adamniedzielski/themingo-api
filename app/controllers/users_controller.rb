
class UsersController < ApplicationController

  def index
    users = User.all
    render :json => users
  end

  def change
    success = [true, false].sample
    if success
      render :json => { :message => "Operation completed" }
    else
      render :json => { :message => "Operation failed" }
    end
  end
end
