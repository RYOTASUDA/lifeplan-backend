# frozen_string_literal: true

json.allPlans do
  json.array! @all_plans do |era, plans|
    json.era era
    json.plans do
      json.array! plans do |plan|
        json.id plan.id
        json.title plan.title
        json.deadline plan.format_deadline_by_period_type
        json.detail plan.detail
        json.periodType plan.period_type
        json.category do
          json.id plan.category.id
          json.name plan.category.name
          json.color plan.category.color
        end
      end
    end
  end
end
