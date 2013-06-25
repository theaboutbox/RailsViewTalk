class AthletesController < ApplicationController
  def show
    @athlete = User.friendly.find params[:id]
    if @athlete.non_profit.nil? || @athlete.event.nil?
      render 'incomplete'
      return
    end
  end
end
