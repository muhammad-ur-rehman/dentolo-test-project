# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Event, type: :model) do
  let(:event) { create(:event) }

  describe 'class methods' do
    describe '#find_or_create' do
      context 'when event is present' do
        it 'should find and update event' do
          dummy_event = event
          expect(Event.find_or_create({ title: dummy_event.title, time: Time.zone.now,
                                        sub_events: dummy_event.sub_events,
                                        web_source: dummy_event.web_source })).to eq(dummy_event)
        end
      end

      context 'when event is not present ' do
        it 'should create new event when not present' do
          expect(Event.find_or_create({ title: 'bny', time: Time.zone.now, sub_events: Faker::String.random(length: 20),
                                        web_source: 'berghain' })).to eq(Event.last)
        end
      end
    end
  end

  describe 'Validations' do
    describe 'Title validation' do
      context 'when title is not present' do
        it 'event should be invalid' do
          event_new = Event.new({ title: nil, time: Time.zone.now, sub_events: Faker::String.random(length: 10),
                                  web_source: 'berghain' })
          expect(event_new).to_not be_valid
        end

        it 'event should be invalid' do
          event_new = Event.new({ title: Faker::Name.name, time: Time.zone.now, sub_events: Faker::String.random(length: 10),
                                  web_source: 'berghain' })
          expect(event_new).to be_valid
        end
      end
    end
  end
end
