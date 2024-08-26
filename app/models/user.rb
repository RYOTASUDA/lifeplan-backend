# frozen_string_literal: true

# 管理画面のユーザー
class User < ApplicationRecord
  GMAIL_REGEXP = %r{\A[a-zA-Z0-9.!\#$%&'*+/=?^_`{|}~-]+@gmail\.com\z}

  validates :name, presence: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            format: { with: GMAIL_REGEXP }
end
