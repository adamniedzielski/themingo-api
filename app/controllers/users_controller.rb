
class UsersController < ApplicationController

  def index
    users = User.all
    render :json => users
  end

  def change
    success = [true, false].sample
    if success
      render :json => { :message => "Red" }
    else
      render :json => { :message => "Blue" }
    end
  end
end
