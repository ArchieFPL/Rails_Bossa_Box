# frozen_string_literal: true

# spec/requests/tool_spec.rb

require 'swagger_helper'
RSpec.describe 'Todos API', type: :request do
  # add todos owner
  let(:user) { create(:user) }
  let!(:tools) { create_list(:tool, 10, created_by: user.id) }
  let(:tool_id) { tools.first.id }
  # authorize request
  let(:headers) { valid_headers }

  # Test suite for GET /tools
  describe 'GET /tools' do
    # make HTTP get request before each example
    # update request with headers
    before { get '/api/v1/tools', params: {}, headers: headers }

    it 'returns tools' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /tools/:id
  describe 'GET /tools/:id' do
    before { get "/api/v1/tools/#{tool_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the tool' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(tool_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:tool_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Tool/)
      end
    end
  end

  # Test suite for POST /tools
  describe 'POST /tools' do
    # valid payload
    let(:valid_attributes) do
      { title: 'N', link: 'http', description: 'nice', tags: %w[organization planning], created_by: user.id.to_s }.to_json
    end

    context 'when the request is valid' do
      before { post '/api/v1/tools', params: valid_attributes, headers: headers }

      it 'creates a tools' do
        expect(json['title']) == 'N'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:invalid_attributes) { { title: nil, description: 'descrition', link: 'link', tags: ['tag'] }.to_json }
      before { post '/api/v1/tools', params: invalid_attributes, headers: headers }
      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(json['message'])
          .to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  # Test suite for PUT /tools/:id
  describe 'PUT api/v1/tools/:id' do
    let(:valid_attributes) { { title: 'Shopping' }.to_json }

    context 'when the record exists' do
      before { put "/api/v1/tools/#{tool_id}", params: valid_attributes, headers: headers }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE api/v1/tools/:id
  describe 'DELETE /tools/:id' do
    before { delete "/api/v1/tools/#{tool_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
