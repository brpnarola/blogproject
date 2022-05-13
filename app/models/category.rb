# frozen_string_literal: true

class Category < ApplicationRecord
  # Association
  belongs_to :user
  has_many   :posts

  # Validation
  validates :title, presence: true
end
