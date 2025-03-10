# frozen_string_literal: true

json.categories do
  json.array! @categories do |category|
    json.extract! category, :id, :name, :color
  end
end
