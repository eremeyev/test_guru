class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  validates :body, presence: true
  
  def first?
    id == test.questions.first.id
  end

  def last?
    id == test.questions.last.id
  end
  
  def correct_answer_ids
    answers.where(correct: true).ids
  end

end
