class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, -> { order(:id) }, dependent: :destroy
  has_many :correct_answers, -> { where(correct: true) }, through: :questions, source: :answers
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  validates :title, :level, presence: true
  LEVELS = %w[simple middle hard]
  validates :level, inclusion: { in: LEVELS }

  scope :by_level, -> (level) { where(level: level) }
  scope :simple, -> { by_level('simple') }
  scope :middle, -> { by_level('middle') }
  scope :hard,   -> { by_level('hard') }
  
  PERCENTS_OF_SUCCESS = 85
  
  def self.titles_by_category(category_title)
    Test.joins(:category).where("categories.title = ?", category_title).pluck(:title).sort
  end
  
  def answer_ids(user)
    test_passages.where(user: user).last.try(:answer_ids) || []
  end
end
