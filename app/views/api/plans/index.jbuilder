json.plans do
  json.array! @plans do |plan|
    json.id plan.id
    json.title plan.title
    json.deadline plan.format_deadline_by_period_type
    json.detail plan.detail
    json.period_type plan.period_type
    json.category do
      json.name plan.category.name
      json.color plan.category.color
    end
  end
end
