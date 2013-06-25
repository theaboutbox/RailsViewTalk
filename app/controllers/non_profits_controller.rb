class NonProfitsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
    @non_profit = @user.non_profit
  end

  def update
    @user = current_user
    @user.update_attribute :non_profit_id, params[:user][:non_profit_id]
    flash[:notice] = "Your non profit has been changed"
    redirect_to root_path
  end
end
