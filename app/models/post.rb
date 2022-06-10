# frozen_string_literal: true

class Post < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :category
  has_many   :comments
  has_many_attached :image

  # Validation
  validates :title, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                              message: 'only allows letters' }
  validates :description, presence: true
  validates :image, presence: true,
                    content_type: ['image/jpg', 'image/jpeg', 'image/png', { size: { less_than: 1.megabytes } }]

  # for action text
  has_rich_text :description
end
