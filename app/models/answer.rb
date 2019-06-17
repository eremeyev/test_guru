class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  scope :right, -> { where(correct: 'Yes') }
  validate :max_count

  def max_count
    errors.add(:answers_count, "answers can't be more than 4 for one question") if question.answers.size >= 4
  end
end
