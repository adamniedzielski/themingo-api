class RegistrationsController < Devise::RegistrationsController
  include UserParams

  def create
    build_resource(user_params)

    if resource.save
      sign_up(resource_name, resource)
      render :json => { :authentication_token => resource.authentication_token }
    else
      render :json => { :errors => resource.errors.full_messages }, :status => :error
    end
  end
end
