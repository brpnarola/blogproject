# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Association
  has_many :categories
  has_many :posts
  has_many :comments

  # Validation
  validates :username, presence: true, format: { with: /\A[a-zA-Z]+\z/,
                                                 message: 'only allows letters' }
end
