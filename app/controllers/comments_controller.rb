class CommentsController < ApplicationController
  before_action :require_login, only: [:create]
  def create
    @comments = Comment.create(user_id: current_user.id, event_id:params[:event_id], comment:params[:comment])
    if @comments.valid?
      redirect_to "/events/#{@comments.event_id}"
    else
      flash[:errors] = @comments.errors.full_messages
      redirect_to "/events/#{@comments.event_id}"
  end

end
