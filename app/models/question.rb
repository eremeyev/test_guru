class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :body, presence: true
  validate :min_answers_count, on: :update
  validate :max_answers_count, on: :update
  MAX_ANSWERS_COUNT = 4
  
  def first?
    id == test.questions.first.id
  end

  def last?
    id == test.questions.last.id
  end
  
  def min_answers_count
    errors.add(:answers_count, "can't be zero.") if answers.size == 0
  end
  

  def max_answers_count
    errors.add(:answers_count, "can't be more than 4.") if answers.size > MAX_ANSWERS_COUNT
  end
  
  def correct_answer_ids
    answers.where(correct: true).ids
  end

end
