class Event < ApplicationRecord
  enum web_source: %i[berlin berghain]

  def self.find_or_create(params)
    puts params
    evt = Event.find_by(title: params[:title])
    return evt if evt&.update(
      time: params[:time].to_date, sub_events: params[:sub_events].to_json,
      web_source: params[:web_source]
    )

    Event.create(
      title: params[:title], time: params[:time].to_date,
      sub_events: params[:sub_events].to_json, web_source: params[:web_source]
    )
  end

  def self.refresh_events
    UpcomingEventsService.call
  end
end
