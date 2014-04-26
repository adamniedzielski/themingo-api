
module UserParams
  extend ActiveSupport::Concern

  def user_params
    params.require(:user).permit  :email, :password, :nickname, :first_name,
                                  :last_name, :description, :age, :location
  end
end
