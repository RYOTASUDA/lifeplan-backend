# frozen_string_literal: true

# 管理画面のユーザー
class User < ApplicationRecord
  has_many :categories, dependent: :destroy
  has_many :plans, dependent: :destroy

  GMAIL_REGEXP = %r{\A[a-zA-Z0-9.!\#$%&'*+/=?^_`{|}~-]+@gmail\.com\z}

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: GMAIL_REGEXP }

  class << self
    def find_or_initialize_by_email(email)
      find_or_initialize_by(email:)
    end
  end
end
