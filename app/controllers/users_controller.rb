
class UsersController < ApplicationController
  include UserParams

  def update
    if current_user.update(user_params)
      head :no_content
    else
      render :json => { :errors => current_user.errors.full_messages },
             :status => :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    head :no_content
  end

  def show
    user = User.find(params[:id])

    if user.friend?(current_user)
      render :json => user
    else
      head :unauthorized
    end
  end

  # TODO remove after first successful integration
  def index
    users = User.all
    render :json => users
  end

  # TODO remove after first successful integration
  def change
    success = [true, false].sample
    if success
      render :json => { :message => "Red" }
    else
      render :json => { :message => "Blue" }
    end
  end
end
