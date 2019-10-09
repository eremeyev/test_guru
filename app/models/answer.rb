class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  scope :right, -> { where(correct: true) }
  validate :answers_qty_can_not_be_more_than_4_for_one_question, on: :create
  validates :body, presence: true
  ANSWERS_LIMIT = 4

  def answers_qty_can_not_be_more_than_4_for_one_question
    errors.add(:answers_count, "can't be more than 4 for one question") if question && question.answers.size >= ANSWERS_LIMIT
  end
end
