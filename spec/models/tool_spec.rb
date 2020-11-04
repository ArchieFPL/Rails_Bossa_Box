# spec/models/tool_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tool, type: :model do
  # Validation tests
  # ensure columns titel and created_by are presente before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:link)  }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:tags) }
  it { should validate_presence_of(:created_by) }
end
