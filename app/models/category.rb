class Category < ApplicationRecord
  has_many :tests
  has_many :test_passages, through: :tests
  validates :title, presence: true
  default_scope { order(title: :asc) }
end
