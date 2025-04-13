# frozen_string_literal: true

class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum :period_type, { life: 0, year: 1, month: 2, week: 3, day: 4 }

  validates :title, presence: true
  validates :deadline, presence: true
  validates :period_type, presence: true

  scope :sort_by_deadline, -> { order(deadline: :asc) }
  scope :group_by_year, -> { group_by { |plan| (plan.deadline.year / 10) * 10 } }

  def self.create_test
    create(
      title: 'test',
      deadline: Time.zone.now.since(30.years),
      detail: 'test',
      period_type: 'life',
      category_id: Category.all.sample.id
    )
  end

  def category
    user.categories.find(category_id)
  end
end
