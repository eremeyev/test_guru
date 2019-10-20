require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  has_secure_password
  
  def tests_by_level(level)
    tests.by_level(level)
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_or_create_by(test_id: test.id)
  end
end
