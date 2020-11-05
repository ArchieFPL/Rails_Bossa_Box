class ToolSerializer < ActiveModel::Serializer
  # attributes to be serialized
  attributes :id, :title, :link, :description,
  :tags, :created_by
end
