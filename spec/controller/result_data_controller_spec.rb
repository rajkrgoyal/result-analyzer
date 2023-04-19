# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ResultDataController, type: :controller do
  describe '#create' do
    describe 'when valid params are passed' do
      let(:params) { { subject: 'Maths', marks: 90.0 } }

      it 'creates a new Result object' do
        expect do
          post :create, params: params
        end.to change { Result.count }.by(1)
      end

      it 'responds with HTTP status 201' do
        post :create, params: params
        expect(response).to have_http_status(:created)
      end
    end
  end
end
