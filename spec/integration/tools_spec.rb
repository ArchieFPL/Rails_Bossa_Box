require 'swagger_helper'

describe 'Tools API' do
  path '/api/v1/tools' do
    get 'List Tools' do
      tags 'Tools'
      consumes 'application/json'
      produces 'application/json'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client token'
                })

      response '200', 'list tools' do
        let(:Authorization) { valid_headers }
        run_test!
      end

      response '422', 'invalid token' do
        let(:Authorization) { invalid_headers }
        run_test!
      end
    end
  end

  path '/api/v1/tools' do
    post 'Create Tool' do
      tags 'Tools'
      consumes 'application/json'
      produces 'application/json'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client Token'
                })
      parameter name: :tool, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          link: { type: :string },
          description: { type: :string },
          tags: { type: :string  }
        },
        required: %w[title link description tags]
      }
      response '201', 'create tool' do
        let(:Authorization) { valid_headers }
        let(:tool) {
          {
            title: "foo",
            link: "foo.com",
            description: "foodescription",
            tags: ["foo", "bar"]
          }
        }
        run_test!
      end
      response '402', 'invalid request' do
        let(:Authorization) { invalid_headers }
        let(:tool) { { title: "foo" } }
        run_test!
      end
    end
  end

  path '/api/v1/tools/{id}' do
    get 'List tool by id' do
      tags 'Tools'
      consumes 'application/json'
      produces 'application/json'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client Token'
                })
      parameter name: :id, in: :path, type: :integer

      response '200', 'tool found' do
        let(:Authorization) { valid_headers }
        run_test!
      end

      response '404', 'tool not found' do
        let(:Authorization) { invalid_headers }
        run_test!
      end
    end
  end

  path '/api/v1/tools/tags' do
    post 'List tool by tag' do
      tags 'Tools'
      consumes 'application/json'
      produces 'application/json'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client Token'
                })
      parameter name: :tool, in: :body, schema: {
        type: :object,
        properties: {
            tags: { type: :string  }
          },
        required: %w[tags]
      }

      response '200', 'tool found' do
        let(:Authorization) { valid_headers }
        run_test!
      end

      response '404', 'tool not found' do
        let(:Authorization) { invalid_headers }
        run_test!
      end
    end
  end

  path '/api/v1/tools/{id}' do
    put 'Search Tool by id' do
      tags 'Tools'
      consumes 'application/json'
      produces 'application/json'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client Token'
                })
      parameter name: :id, in: :path, type: :integer
      parameter name: :tool, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          link: { type: :string },
          description: { type: :string },
          tags: { type: :string  }
        }
      }

      response '204', 'no content' do
        let(:tool) { { name: 'Insonmia' } }
        let(:Authorization) { valid_headers }
        run_test!
      end

      response '404', 'tool not found' do
        let(:Authorization) { invalid_headers }
        run_test!
      end
    end
  end

  path '/api/v1/tools/{id}' do
    delete 'delete tool by id' do
      tags 'Tools'
      consumes 'application/json'
      produces 'application/json'
      parameter({
                  in: :header,
                  type: :string,
                  name: :Authorization,
                  required: true,
                  description: 'Client Token'
                })
      parameter name: :id, in: :path, type: :integer

      response '204', 'no content' do
        let(:Authorization) { valid_headers }
        run_test!
      end

      response '404', 'tool not found' do
        let(:Authorization) { invalid_headers }
        run_test!
      end
    end
  end
end
