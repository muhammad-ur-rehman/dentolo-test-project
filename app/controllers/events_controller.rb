class EventsController < ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result
  end

  def refresh
    Event.refresh_events
    redirect_to root_path
  end
end
