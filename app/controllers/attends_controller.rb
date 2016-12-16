class AttendsController < ApplicationController
  def create
    Attend.create(user_id:current_user.id, event_id:params[:id])
    redirect_to "/events"
  end
  def destroy
    @attends = Attend.find_by(user_id:current_user.id, event_id:params[:id])
    @attends.destroy
    redirect_to "/events"
  end
end
