class EventsController < ApplicationController
  before_action :check_user, only: %i[new create]
  def index
    @events = Event.all
    @upcoming = Event.upcoming
    @past = Event.past
  end

  def new
    @event = Event.new
  end

  def create
    user = User.find(check_user)
    @event = user.hosted_events.build(events_params)
    if @event.save
      flash[:success] = 'event created succesfully'
      redirect_to events_path
    else
      flash[:alert] = "we couldn't submit your event"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def events_params
    params.require(:event).permit(:name, :description, :location, :date, :creator_id)
  end

  def check_user
    session[:current_user]
  end
end
