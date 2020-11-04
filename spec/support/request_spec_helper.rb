# spec/support/request_spec_helper

# frozen_string_literal: true

# Parser JSON response to Ruby Hash
module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end
