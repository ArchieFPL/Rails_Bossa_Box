# app/models/tool.rb

# frozen_string_literal: true

# File way generate by Rails, validates the presence of all fields to create a tool.
# Test in /spec/models/tool_spec.rb
class Tool < ApplicationRecord
  # validations
  validates_presence_of :title, :link, :description, :tags, :created_by
end
