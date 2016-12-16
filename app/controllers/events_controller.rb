class EventsController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  before_action :require_correct_user, only: [:destroy]
  def create
    @event = current_user.events.create( event_params )
    @attend = Attend.create(user_id:current_user.id, event_id:@event.id)
    if @event.valid?
      redirect_to "/events"
    else
      flash[:errors] = @event.errors.full_messages
      redirect_to "/event"
    end
  end
  def destroy
    Event.find(params[:event_id]).destroy
    redirect_to "/events"
  end
  def edit
    redirect_to "/events"
  end
  def index
    @event = Event.find(params[:id])
    @comments = Comment.where(event_id: @event)
  end

  def show
    @user = User.find(current_user.id)
    @events = Event.where(state:current_user.state)
    @other_event = Event.where.not(state:current_user.state)
  end
  private
  def event_params
  params.require(:event).permit(:name, :date, :city, :state, :user_id)
  end
end
