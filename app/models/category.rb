# frozen_string_literal: true

class Category < ApplicationRecord
  # Association
  belongs_to :user
  has_many   :posts

  # Validation
  validates :title, presence: true, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
end
