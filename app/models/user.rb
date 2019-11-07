class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :my_tests, class_name: 'Test', foreign_key: :author_id
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  
  def tests_by_level(level)
    tests.by_level(level)
  end
  
  def test_passage(test)
    test_passages.order(id: :desc).find_or_create_by(test_id: test.id)
  end
  
  def admin?
    is_a?(Admin)
  end
end
