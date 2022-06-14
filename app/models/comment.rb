# frozen_string_literal: true

class Comment < ApplicationRecord
  # Association
  belongs_to :user
  belongs_to :post
  has_many_attached :image

  # Validation
  validates :description, presence: true
  #validates :image, presence: true,
                    #content_type: ['image/jpg', 'image/jpeg', 'image/png', { size: { less_than: 1.megabytes } }]
  has_rich_text :description
end
