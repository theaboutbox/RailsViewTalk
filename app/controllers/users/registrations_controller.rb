class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new sign_up_params
    if @user.save
      sign_in @user
      go_to_next_state
    else
      render :new
    end
  end

  def update
    @user = current_user
    @user.update_attributes sign_up_params
    go_to_next_state
  end

  def go_to_next_state
    @user.next_state
    if @user.valid?
      @user.save
      if @user.complete?
        flash[:notice] = "Thank you for registering"
        redirect_to root_path
      else
        redirect_to edit_user_registration_path
      end
    else
      render :edit
    end

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
