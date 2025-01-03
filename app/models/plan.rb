class Plan < ApplicationRecord
  belongs_to :user

  enum period_type: { life: 0, year: 1, month: 2, week: 3, day: 4 }

  validates :title, presence: true
  validates :deadline, presence: true
  validates :detail, presence: true
  validates :period_type, presence: true

  scope :sort_by_deadline, -> { order(deadline: :asc) }

  def self.test_record
    create!(
      title: 'test title',
      deadline: Time.zone.now,
      detail: 'test detail',
      period_type: 0,
      category_id: Category.first.id
    )
  end

  def format_deadline_by_period_type
    case period_type
    when 'life', 'year'
      deadline.strftime('%Y年%m月')
    when 'month'
      deadline.strftime('%Y年%m月%d日')
    when 'week'
      deadline.strftime('%Y年%m月%d日')
    when 'day'
      deadline.strftime('%Y年%m月%d日 %H:%M')
    end
  end

  def category
    user.categories.find(category_id)
  end
end
