class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    tests.by_level(level)
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_or_create_by(test_id: test.id)
  end
end
