require 'swagger_helper'

describe 'Tools API' do

  path '/auth/login' do

    post 'Authenticate User' do
      tags 'Authenticate'
      consumes 'application/json'
      parameter name: :authenticate, in: :body, schema: 
      {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '200', 'user authenticate' do
        let(:user) { { email: 'registeremail@email.com', password: 'register_password' } }
        run_test!
      end

      response '401', 'user unauthorized' do
        let(:user) { { email: 'false@email.com', password: 'false_password' } }
        run_test!
      end
    end
  end
end
