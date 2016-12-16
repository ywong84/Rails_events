class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:Email])
    if @user && @user.authenticate(params[:Password])
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid"]
      redirect_to "/sessions/new"
    end
  end

  def destroy
    session.clear
    redirect_to "/sessions/new"
  end
end
