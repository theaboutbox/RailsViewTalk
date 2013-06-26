class Users::RegistrationsController < Devise::RegistrationsController
  
  def new
    @user = User.new
    @user.build_home_address
    @user.build_work_address
  end

  def create
    super
  end

  def sign_up_params 
    params.require(:user).permit(
      :email, :password, :password_confirmation, :first_name, :last_name,
      { home_address_attributes: ADDRESS_ATTRIBUTES},
      { work_address_attributes: ADDRESS_ATTRIBUTES},
      :non_profit_id,
      :event_id
    )
  end
  private :sign_up_params

  ADDRESS_ATTRIBUTES = [:street, :suite, :city, :region, :post_code, :country]

end
