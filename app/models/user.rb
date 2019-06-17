class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    tests.where(level: level)
  end
end
