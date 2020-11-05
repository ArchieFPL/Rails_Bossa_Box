# frozen_string_literal: true

# Respond with JSON and an HTTP status code(200 default)
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
