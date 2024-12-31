# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user

  DEFAULT_CATEGORIES = [
    { name: 'お金', color: '#fab005' },
    { name: '家庭', color: '#fd7e14' },
    { name: '仕事', color: '#228be6' },
    { name: '健康', color: '#40c057' },
    { name: '趣味', color: '#be4bdb' },
    { name: '精神', color: '#15aabf' }
  ].freeze
  private_constant :DEFAULT_CATEGORIES

  validates :name, presence: true, uniqueness: true
  validates :color, presence: true,
                    format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/ }

  scope :search_by_user, ->(user) { where(user:) }

  class << self
    def create_default_categories(user)
      DEFAULT_CATEGORIES.each do |category|
        user.categories.create(category)
      end
    end
  end
end
