class SessionsController < Devise::SessionsController
  acts_as_token_authentication_handler_for User, :only => :destroy

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render :json => { :authentication_token => resource.authentication_token }
  end

  def destroy
    user = current_user

    if sign_out
      user.authentication_token = nil
      user.save!
      render :json => { :status => "success" }
    else
      render :json => { :status => "You were not signed in" }
    end
  end
end
