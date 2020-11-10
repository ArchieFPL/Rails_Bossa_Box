require 'swagger_helper'

describe 'Tools API' do
  path '/api/v1/signup' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema:
      {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string},
          password_confirmation: {type: :string }
        },
        required: [ 'email', 'password', 'password_confirmation' ]
      }

      response '201', 'user created' do
        schema type: :object,
          properties: {
            message: { type: :string },
            token: { type: :string }
          },
          required: [ 'message', 'token' ]
        let(:user) { { email: 'foo@email.com', password: 'bar', password_cofirmation: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        schema type: :object,
          properties: {
            message: { type: :string }
          },
          required: [ 'error_message' ]
        let(:user) { { email: 'foo' } }
        run_test!
      end
    end
  end
end
