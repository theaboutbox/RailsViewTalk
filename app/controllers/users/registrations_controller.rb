class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super
  end

  def sign_up_params 
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
  private :sign_up_params

end
