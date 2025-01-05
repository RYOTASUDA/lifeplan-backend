# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user
  has_many :plans, dependent: :destroy

  DEFAULT_CATEGORIES = [
    { name: 'お金', color: '#fab005' },
    { name: '家庭', color: '#fd7e14' },
    { name: '仕事', color: '#228be6' },
    { name: '健康', color: '#40c057' },
    { name: '趣味', color: '#be4bdb' },
    { name: '精神', color: '#15aabf' },
    { name: 'その他', color: '#868e96' }
  ].freeze
  private_constant :DEFAULT_CATEGORIES

  validates :name, presence: true
  validates :color, presence: true,
                    format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/ }

  scope :search_by_user, ->(user) { where(user:) }

  class << self
    def create_default
      DEFAULT_CATEGORIES.each do |default_category|
        create(default_category)
      end
    end
  end
end
