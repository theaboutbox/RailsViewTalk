class EventsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
    @event = @user.event
  end

  def update
    @user = current_user
    @user.update_attribute :event_id, params[:user][:event_id]
    flash[:notice] = "Your event has been changed"
    redirect_to root_path
  end
end
