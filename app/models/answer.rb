class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  scope :right, -> { where(correct: 'Yes') }
  validate :max_count
  ANSWERS_LIMIT = 4

  def max_count
    errors.add(:answers_count, "answers can't be more than 4 for one question") if question.answers.size >= ANSWERS_LIMIT
  end
end
