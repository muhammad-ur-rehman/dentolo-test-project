require "HTTParty"

class BerlinEventsService
  def self.call
    new.call
  end

  def call
    response = HTTParty.get('https://www.co-berlin.org/en/calender')
    extract_events(response.body)
  end

  private

  def document(html)
    Nokogiri::HTML(html)
  end

  def extract_events(html)
    doc = document(html)
    doc.css('.view-calendar>.view-content>.views-row').map do |event|
      {
        title: event_title(event),
        time: event_time(event),
        sub_events: sub_events(event),
        web_source: 'berlin'
      }
    end
  end

  def event_title(event)
    strip_white_spaces(event.css('.block-field-blocknodeeventtitle').text)
  end

  def event_time(event)
    event.css('.date-display-range').text
  end

  def sub_events(event)
    {
      "1": {
        venue: strip_white_spaces(event.css('.block-field-blocknodeeventfield-subtitle').text)
      }
    }
  end

  def strip_white_spaces(str)
    str.gsub(/[\n,]/, '').strip
  end
end
