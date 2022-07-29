# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:event) { create(:event) }

  describe '#index' do
    context 'when events index is called' do
      it 'should response properly' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end
end
