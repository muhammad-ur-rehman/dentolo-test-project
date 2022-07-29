# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { Faker::Name.name }
    time { Time.zone.now }
    sub_events { Faker::String.random(length: 20) }
    web_source { %i[berlin berghain].sample }
  end
end
