class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, -> { order(:id) }
  has_many :correct_answers, -> { where(correct: true) }, through: :questions, source: :answers
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  validates :title, :level, presence: true
  validates :level, numericality: { only_integer: true,  greater_than_or_equal_to: 0 }
  scope :by_level, -> (level) { where(level: level) }
  scope :simple, -> { by_level(0..1) }
  scope :middle, -> { by_level(2..4) }
  scope :hard,   -> { bylevel(5..Float::INFINITY) }
  PERCENTS_OF_SUCCESS = 85
  
  def self.titles_by_category(category_title)
    Test.joins(:category).where("categories.title = ?", category_title).pluck(:title).sort
  end
  
  def percents_of_success(user)
    test_passage = test_passages.find_by(user_id: user.id)
    correct_percents = 100.0 / correct_answers.size * test_passage.correct_questions
    return correct_percents.round(0) if correct_answers.present?
    0
  end
  
  def success?(user)
    percents_of_success(user) >= Test::PERCENTS_OF_SUCCESS
  end
  
  def answer_ids(user)
    test_passages.where(user: user).last.try(:answer_ids) || []
  end
end
