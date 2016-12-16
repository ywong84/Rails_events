class UsersController < ApplicationController
  before_action :require_login, only: [:update, :destroy]
  before_action :require_correct_user, only: [:destroy]
  def new
  end

  def create
    @user = User.create( user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to "/sessions/new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id]).update( user_params )
    redirect_to "/events"
  end

  def destroy
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password)
  end
end
