require "HTTParty"

class BerghainEventsService
  def self.call
    new.call
  end

  def call
    response = HTTParty.get('https://www.berghain.berlin/en/program/')
    extract_events(response.body)
  end

  private

  def document(html)
    Nokogiri::HTML(html)
  end

  def extract_events(html)
    doc = document(html)
    doc.css('.upcoming-event').map do |event|
      {
        title: event_title(event),
        time: event_time(event),
        sub_events: sub_events(event),
        web_source: 'berghain'
      }
    end
  end

  def event_title(event)
    strip_white_spaces(event.css('h2').text)
  end

  def event_time(event)
    arr = event.css('p').text.gsub(/\n/, '').split(' ')
    arr.delete('start')
    arr.join(' ')
  end

  def sub_events(event)
    events = {}
    event.css('h3').each_with_index do |v, i|
      events[i.to_s] = {
        venue: strip_white_spaces(v.text),
      }
    end
    events
  end

  def strip_white_spaces(str)
    str.gsub(/[\n,]/, '').strip
  end
end
